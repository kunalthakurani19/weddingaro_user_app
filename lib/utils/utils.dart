import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  // static toastMessage(String message) {
  //   Fluttertoast.showToast(
  //     msg: message,
  //     // backgroundColor: Colors.black,
  //     textColor: Colors.white,
  //     // webBgColor: Colors.black,
  //   );
  // }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        forwardAnimationCurve: Curves.decelerate,
        reverseAnimationCurve: Curves.easeInOut,
        icon: const Icon(
          Icons.error,
          size: 28,
          color: Colors.white,
        ),
        // margin: EdgeInsets.symmetric(horizontal: 20, ver),
        duration: const Duration(seconds: 2),
      )..show(context),
    );
  }

  static flushBarSucessMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        forwardAnimationCurve: Curves.decelerate,
        reverseAnimationCurve: Curves.easeInOut,
        icon: const Icon(
          Icons.check_circle_outline,
          size: 28,
          color: Colors.white,
        ),
        backgroundColor: const Color.fromARGB(255, 27, 136, 27),
        // margin: EdgeInsets.symmetric(horizontal: 20, ver),
        duration: const Duration(seconds: 4),
      )..show(context),
    );
  }

  static snackBarMessage(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Text(message),
    ));
  }
}
