import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_feed_task/services/navigation_service/navigator.dart';

class ShowToast {
  static void customToast(String message, {Color? bgColor = Colors.black, Color? textColor = Colors.white, int durationInSeconds = 3}) {
    final context = NavigationService.navigatorKey.currentContext;

    if (context != null) {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: bgColor,
        textColor: textColor,
        fontSize: 16.0,
        timeInSecForIosWeb: durationInSeconds,
      );
    } else {
      debugPrint("Toast Error: Current context is null");
    }
  }
}
