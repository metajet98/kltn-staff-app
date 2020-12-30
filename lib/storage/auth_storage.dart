import 'dart:convert';

import 'package:staff_maintenance_app/storage/storage.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class AuthStorage extends Storage<AuthToken> {
  final String KEY_ACCESS_TOKEN = "access_token";
  final String KEY_REFRESH_TOKEN = "refresh_token";
  final String KEY_EXPIRED_IN = "expired_in";
  AuthStorage(SharedPreferences prefs) : super(prefs, 'auth_token');

  @override
  AuthToken get({AuthToken defaultValue}) {
    final String accessToken = prefs.getString(KEY_ACCESS_TOKEN);
    final String refreshToken = prefs.getString(KEY_REFRESH_TOKEN);
    final int expiredIn = prefs.getInt(KEY_EXPIRED_IN) ?? 0;
    return AuthToken(accessToken, refreshToken, DateTime.fromMillisecondsSinceEpoch(expiredIn*1000));
  }

  @override
  void set(AuthToken value) {
    prefs.setString(KEY_ACCESS_TOKEN, value.accessToken);
    prefs.setString(KEY_REFRESH_TOKEN, value.refreshToken);
    prefs.setInt(KEY_EXPIRED_IN, value.expiredIn.millisecondsSinceEpoch~/1000);
  }

  @override
  void remove() {
    prefs.remove(KEY_EXPIRED_IN);
    prefs.remove(KEY_REFRESH_TOKEN);
    prefs.remove(KEY_ACCESS_TOKEN);
  }
}

class AuthToken {
  final String accessToken;
  final String refreshToken;
  final DateTime expiredIn;

  AuthToken(this.accessToken, this.refreshToken, this.expiredIn);

  bool get isExpired => expiredIn?.isBefore(DateTime.now()) == true;
}