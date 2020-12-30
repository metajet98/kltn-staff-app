import 'package:staff_maintenance_app/storage/storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class FcmTokenStorage extends Storage<String> {
  FcmTokenStorage(SharedPreferences prefs) : super(prefs, 'fcm_token');

  @override
  String get({String defaultValue}) {
    return prefs.getString(key) ?? defaultValue;
  }

  @override
  void set(String value) {
    prefs.setString(key, value);
  }
}