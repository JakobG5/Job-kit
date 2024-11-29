import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/confirmation_screen.dart';

class VerificationController extends GetxController {
  static VerificationController get instance => Get.find();

  static final ctrl1 = TextEditingController();
  static final ctrl2 = TextEditingController();
  static final ctrl3 = TextEditingController();
  static final ctrl4 = TextEditingController();

  static RxBool field1 = false.obs;
  static RxBool field2 = false.obs;
  static RxBool field3 = false.obs;

  List<RxBool> enabled = [
    field1,
    field2,
    field3,
  ];

  List<TextEditingController> controller = [
    ctrl1,
    ctrl2,
    ctrl3,
    ctrl4,
  ];

  void toogleEnbaledT(int index) {
    enabled[index].value = true;
  }

  void toogleEnbaledF(int index) {
    enabled[index].value = false;
  }

  bool isEnabled(int index) {
    if (index == 0) {
      return true;
    } else if (enabled[index - 1].value) {
      return true;
    } else {
      return false;
    }
  }

  void goToConfirmation() {
    Get.to(const ConfirmationScreen());
  }

  void verifyOtp(String otp) {}
}
