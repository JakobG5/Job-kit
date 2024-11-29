import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:job_kit/feautures/autentication/model/onBoarding_model.dart';
import 'package:job_kit/utils/constants/text.dart';
import '../../../utils/constants/image.dart';
import '../screens/register_screen.dart';

class OnBoargingController extends GetxController {
  static OnBoargingController get instance => Get.find();
  final pageController = PageController();
  final Rx<int> currentIndex = 0.obs;

  List<OnBoardingModel> items = [
    OnBoardingModel(
        imagePath: JImage.onboardingImage1,
        title: JText.onBoardingTitle1,
        description: JText.onBoardingDescription1),
    OnBoardingModel(
        imagePath: JImage.onboardingImage2,
        title: JText.onBoardingTitle2,
        description: JText.onBoardingDescription2),
    OnBoardingModel(
        imagePath: JImage.onboardingImage3,
        title: JText.onBoardingTitle3,
        description: JText.onBoardingDescription3),
    OnBoardingModel(
        imagePath: JImage.onboardingImage4,
        title: JText.onBoardingTitle4,
        description: JText.onBoardingDescription4),
    OnBoardingModel(
        imagePath: JImage.onboardingImage5,
        title: JText.onBoardingTitle5,
        description: JText.onBoardingDescription6),
    OnBoardingModel(
        imagePath: JImage.onboardingImage6,
        title: JText.onBoardingTitle6,
        description: JText.onBoardingDescription1),
  ];

  void skipButton() {
    currentIndex.value = items.length - 1;
    pageController.jumpToPage(currentIndex.value);
  }

  void nextButton() {
    if (currentIndex.value < items.length - 1) {
      currentIndex.value = currentIndex.value + 1;
      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void onPageChanged(int value) {
    currentIndex.value = value;
  }

  void exploreBtn() {
    Get.offAll(() => const RegisterScreen());
  }
}
