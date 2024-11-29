import 'package:get/get.dart';
import 'package:job_kit/feautures/autentication/screens/login_screen.dart';

class ConfirmationController extends GetxController {
  static ConfirmationController get instance => Get.find();

  void goToLogin() {
    Get.to(() => const LoginScreen());
  }
}
