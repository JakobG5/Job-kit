import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetController extends GetxController {
  static ResetController get instance => Get.find();

  final passwordController = TextEditingController();
  final confirmPassword = TextEditingController();
  final RxBool isVisible = false.obs;

  void toogleVisibility() {
    isVisible.value = !isVisible.value;
  }
}
