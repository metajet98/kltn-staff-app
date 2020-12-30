import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigatorHelper {
  static void popAllFrom(String routeName) {
    var shouldFinishPop = false;
    Get.until((route) {
      if (shouldFinishPop) return true;
      if (route is GetPageRoute && route.routeName == routeName) {
        shouldFinishPop = true;
      }
      return false;
    });
  }

  static void pushAndPopAllFrom<T>(Widget newPage, String routeName) {
    var shouldFinishPop = false;
    Get.offAll(newPage, predicate: (route) {
      if (shouldFinishPop) return true;
      if (route is GetPageRoute && route.routeName == routeName) {
        shouldFinishPop = true;
      }
      return false;
    });
  }
}
