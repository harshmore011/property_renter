import 'package:flutter/material.dart' show SnackBar,BuildContext,ScaffoldMessenger,Text,TextStyle,Colors;

class SnackBarMessage {

  static void showSnackBar(
      {required String message, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          // style: const TextStyle(color: Colors.white),
        ),
        // backgroundColor: Colors.green,
      ),
    );
  }

}
