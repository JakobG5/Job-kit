import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/validators/validator.dart';
import '../model/textFieldModel.dart';
import '../screens/verification_screen.dart';

class ForgotController extends GetxController {
  static ForgotController get instance => Get.find();

  // Observable for tracking selected input type (true = email, false = phone)
  RxBool isEmailSelected = true.obs;
  RxInt selectedIndex = 0.obs;
  static RxBool defObscure = false.obs;

  static GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  static GlobalKey<FormState> phoneKey = GlobalKey<FormState>();
  List<GlobalKey<FormState>> keyType = [emailKey, phoneKey];

  // Text controllers for email and phone input
  static final emailController = TextEditingController();
  static final phoneController = TextEditingController();

  // Toggle between email and phone inputs
  void toggleEmail() {
    isEmailSelected.value = true;
    selectedIndex.value = 0;
  }

  void tooglPassword() {
    isEmailSelected.value = false;
    selectedIndex.value = 1;
  }

  // Navigate to Verification Screen
  void goToVerificationScreen() {
    if (keyType[selectedIndex.value].currentState!.validate()) {
      Get.to(const VerificationScreen());
    }
  }

  List<TextFieldModel> selectedField = [
    TextFieldModel(
      controller: emailController,
      inputType: TextInputType.emailAddress,
      isObscure: defObscure,
      label: 'Enter ypur email',
      validator: (value) => Validator.validateEmail(value!),
      prefixIcon: Icons.email,
    ),
    TextFieldModel(
      controller: phoneController,
      inputType: TextInputType.phone,
      isObscure: defObscure,
      label: '+251 ... ',
      validator: (value) => Validator.validatePhoneNumber(value!),
      prefixIcon: Icons.phone_android_outlined,
    ),
  ];
  // Dispose controllers when done
}
