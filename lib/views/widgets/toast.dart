
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> flutterToast({
  required String msg,
  Color backgroundColor = Colors.black87,
  Color textColor = Colors.white,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: backgroundColor,
    textColor: textColor,
    fontSize: 16.0,
  );
}
