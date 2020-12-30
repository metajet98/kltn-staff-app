import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';
import 'dart:ui';

import 'package:staff_maintenance_app/backend/services/fcm_service.dart';
import 'package:staff_maintenance_app/fcm/fcm_message_handler_routes.dart';
import 'package:staff_maintenance_app/fcm/fcm_payload.dart';
import 'package:staff_maintenance_app/locator.dart';
import 'package:staff_maintenance_app/logger.dart';
import 'package:staff_maintenance_app/storage/fcm_token_storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FcmManager {
  static const String fcmBackgroundMessagePortName = "fcm_background_message";

  final _firebaseMessaging = FirebaseMessaging();

  final _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<dynamic> backgroundMessageHandler(Map<String, dynamic> message) {
    final SendPort sendPort = IsolateNameServer.lookupPortByName(fcmBackgroundMessagePortName);
    sendPort.send(message);
    return Future.value();
  }

  FcmManager() {
    _setupLocalNotificationPlugin();
    _setupFcmBackgroundMessageReceiver();
  }

  void _setupLocalNotificationPlugin() {
    const initializationSettingsAndroid = AndroidInitializationSettings('ic_notification');
    const initializationSettingsIOS = IOSInitializationSettings();
    const initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    _localNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (json) async => _onMessage(FcmPayload.fromJson(json)));
  }

  void _setupFcmBackgroundMessageReceiver() {
    final ReceivePort receivePort = ReceivePort();
    final SendPort sendPort = receivePort.sendPort;
    IsolateNameServer.registerPortWithName(sendPort, fcmBackgroundMessagePortName);
    receivePort.listen((message) => _onMessage(FcmPayload.create(message as Map<String, dynamic>)));
  }

  void init() {
    _firebaseMessaging.configure(
      onMessage: (message) async {
        final payload = FcmPayload.create(message);
        if (payload.isDataMessage) {
          _onMessage(payload);
        } else {
          _pushNotification(payload);
        }
      },
      onBackgroundMessage: backgroundMessageHandler,
      onLaunch: (message) async => _onMessage(FcmPayload.create(message)),
      onResume: (message) async => _onMessage(FcmPayload.create(message)),
    );
    _firebaseMessaging.requestNotificationPermissions(const IosNotificationSettings(
      provisional: true,
    ));
  }

  void _pushNotification(FcmPayload payload) {
    logger.d("On Notification - Payload ${payload.toJson()}");
    final bigTextStyleInformation = BigTextStyleInformation(payload.body);
    final androidPlatformChannelSpecifics = AndroidNotificationDetails('global_channel', 'Global notifications', 'All of notifications',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        vibrationPattern: Int64List.fromList([0, 500]),
        styleInformation: bigTextStyleInformation);
    const iOSPlatformChannelSpecifics = IOSNotificationDetails();
    final platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    _localNotificationsPlugin.show(0, payload.title, payload.body, platformChannelSpecifics, payload: payload.toJson());
  }

  void _onMessage(FcmPayload payload) {
    logger.d("On Message - Payload ${payload.toJson()}");
    fcmMessageHandlerRoutes[payload.activity]?.handle(payload);
  }

  Future<void> registerToken() async {
    if (locator<FcmTokenStorage>().get() != null) {
      return;
    }

    final token = await _firebaseMessaging.getToken();
    await locator<FcmService>().register(token: token, platform: Platform.operatingSystem);
    locator<FcmTokenStorage>().set(token);
  }

  Future<void> unregisterToken() async {
    final token = await _firebaseMessaging.getToken();
    await locator<FcmService>().unregister(token: token);
    locator<FcmTokenStorage>().remove();
  }
}
