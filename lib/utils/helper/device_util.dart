import 'dart:io';
import 'package:flutter/material.dart';

class JHelper {
  static double? getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double? getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double? getAppBarHeight(BuildContext context) {
    return kToolbarHeight;
  }

  // Add this method to check if the platform is iOS
  static bool isIOS() {
    return Platform.isIOS;
  }
}
