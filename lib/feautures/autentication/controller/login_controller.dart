import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/feautures/autentication/screens/register_screen.dart';
import '../../../data/repository/autentication/firebase_auth_repository.dart';
import '../../presentation/controller/home_screen_controller.dart';
import '../screens/forgot_screen.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final controller = Get.put(HomeScreenController(), permanent: true);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final RxBool isVisible = false.obs;
  final RxBool defaultVisibility = false.obs;
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  void toogleVisibility() {
    isVisible.value = !isVisible.value;
  }

  void goToRegister() {
    Get.off(() => const RegisterScreen());
  }

  void goToForgetPassword() {
    Get.off(() => const ForgotScreen());
  }

  void login() async {
    if (!loginKey.currentState!.validate()) return;
    try {
      await AutenticationRepository.instance.loginWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
    } catch (e) {
      Get.snackbar(
        "Login Failed",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }
}
