import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppCommon {
  static double kBaseHeight = 1200.0;
  static double deviceHeight = 0.0;
  static double deviceWidth = 0.0;
  static EdgeInsets devicePadding = EdgeInsets.all(0.0);
  static String firebaseToken = "";

  // static double screenAwareSize(double size) {
  //   if (deviceHeight == 0.0) {
  //     var mediaQuery = MediaQuery.of(GlobalVariable.navState.currentContext!);
  //     deviceHeight = mediaQuery.size.height;
  //     devicePadding = mediaQuery.padding;
  //   }
  //   double drawingHeight = deviceHeight - devicePadding.top;
  //   return size * drawingHeight / kBaseHeight;
  // }

  String getFormatedDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  String getFormatedTime(DateTime date) {
    return "${date.hour}:${date.minute}${date.minute == 0 ? "0" : ""}";
  }


  static String convertArabicNumToEnglish(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

    for (int i = 0; i < arabic.length; i++) {
      input = input.replaceAll(arabic[i], english[i]);
    }
    return input;
  }
}