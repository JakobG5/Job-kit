import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/repository/autentication/firebase_auth_repository.dart';
import '../screens/login_screen.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final RxBool isVisible = false.obs;
  final RxBool defaultVisibility = false.obs;
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  void toogleVisibility() {
    isVisible.value = !isVisible.value;
  }

  void goToLogin() {
    Get.off(() => const LoginScreen());
  }

  void register() async {
    if (!registerKey.currentState!.validate()) return;
    await AutenticationRepository.instance.registerWithEmailAndPassword(
        emailController.text.trim(), passwordController.text.trim());
  }
}
