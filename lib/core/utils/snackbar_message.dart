import 'package:flutter/material.dart' show BuildContext, ScaffoldMessenger, SnackBar, SnackBarBehavior, Text, TextStyle;

class SnackBarMessage {

  static void showSnackBar(
      {required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          // style: const TextStyle(color: Colors.white),
        ),
        // backgroundColor: Colors.green,
      ),
    );
  }

}
