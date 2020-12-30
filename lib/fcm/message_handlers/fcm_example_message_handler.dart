
import 'package:staff_maintenance_app/fcm/fcm_payload.dart';
import 'package:staff_maintenance_app/fcm/message_handlers/fcm_message_handler.dart';

class FcmExampleMessageHandler extends FcmMessageHandler {
  static const activity = "example";

  @override
  void handle(FcmPayload payload) {
    throw UnimplementedError();
  }
}