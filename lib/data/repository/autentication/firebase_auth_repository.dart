import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import '../../../feautures/autentication/screens/onBoarding_screen.dart';
import '../../../feautures/presentation/main_route.dart';
import '../../../feautures/user/screens/user_data.dart';
import '../../../utils/exception/firebase_auth_exception.dart';

class AutenticationRepository extends GetxController {
  static AutenticationRepository get instance => Get.find();

  late final Rx<User?> firebaseUser;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  @override
  onInit() async {
    super.onInit();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, (user) => setScreen(user));
    FlutterNativeSplash.remove();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  Future<void> setScreen(User? user) async {
    if (user != null) {
      await isNewUser(user);
    } else {
      Get.offAll(() => const OnboardingScreen());
    }
  }

  Future<void> isNewUser(User user) async {
    try {
      final userDoc = await _firestore.collection('users').doc(user.uid).get();
      if (!userDoc.exists) {
        Get.offAll(() => const UserData());
      } else {
        Get.offAll(() => const MainRoute());
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to check user: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar('Success', 'Logged in successfully!',
          snackPosition: SnackPosition.BOTTOM);
    } on FirebaseAuthException catch (e) {
      FireBaseAuthException.handleAuthException(e);
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Future function for registering with email and password
  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar('Success', 'Registered successfully!',
          snackPosition: SnackPosition.BOTTOM);
    } on FirebaseAuthException catch (e) {
      FireBaseAuthException.handleAuthException(e);
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Future function for logging out
  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.snackbar('Success', 'Logged out successfully!',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Future function for resetting password with email
  Future<void> resetPasswordWithEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar('Success', 'Password reset email sent!',
          snackPosition: SnackPosition.BOTTOM);
    } on FirebaseAuthException catch (e) {
      FireBaseAuthException.handleAuthException(e);
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Future function for resetting with phone number (Firebase phone verification setup required)
  Future<void> resetWithPhoneNumber(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          Get.snackbar('Success', 'Phone number verified!',
              snackPosition: SnackPosition.BOTTOM);
        },
        verificationFailed: (FirebaseAuthException e) {
          FireBaseAuthException.handleAuthException(e);
        },
        codeSent: (String verificationId, int? resendToken) {
          Get.snackbar('Success', 'Verification code sent!',
              snackPosition: SnackPosition.BOTTOM);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> changePassword(String newPassword) async {
    try {
      await firebaseUser.value?.updatePassword(newPassword);
      Get.snackbar('Success', 'Password changed succedfully!',
          snackPosition: SnackPosition.BOTTOM);
    } on FirebaseAuthException catch (e) {
      FireBaseAuthException.handleAuthException(e);
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
