import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:staff_maintenance_app/backend/http_error.dart';

abstract class BaseViewModel<T extends StatefulWidget> {
  T view;

  dynamic _error;

  String get errorMessage {
    if (_error == null) {
      return null;
    }

    if (_error is HttpError) {
      final HttpError httpError = _error as HttpError;
      return httpError.message;
    }

    if (_error is SocketException) {
      return "Không thể kết nối đến máy chủ, vui lòng kiểm tra lại mạng!";
    }

    return _error.toString();
  }

  void onInit() {}

  void onDispose() {}

  @protected
  Future<bool> call(dynamic Function() handler, {bool toastOnError = false, bool background = false}) async {
    try {
      _error = null;
      if (!background) {
        EasyLoading.show(status: "Vui lòng chờ...");
      }
      final result = handler();
      if (result is Future) {
        await result;
      }
      if (!background) {
        EasyLoading.dismiss();
      }
      return true;
    } catch (e) {
      _error = e;
      if (!background) {
        EasyLoading.dismiss();
      }
      if (toastOnError) {
        await Fluttertoast.showToast(msg: errorMessage);
      }
      return false;
    }
  }
}
