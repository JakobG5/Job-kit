import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../common/style/text_style.dart';
import '../../../common/widget/custom_btn1.dart';
import '../../../common/widget/custom_btn2.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/space.dart';
import '../../../utils/helper/device_util.dart';
import '../controller/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoargingController());

    return Scaffold(
      backgroundColor: JColors.background,
      body: Stack(
        children: [
          Positioned(
            top: -321,
            left: -52,
            child: Container(
              height: 460,
              width: 460,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: JColors.steelGrey,
              ),
            ),
          ),
          Positioned(
            top: 179,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                height: JHelper.getHeight(context)! * .7,
                width: JHelper.getWidth(context)! * 0.9,
                child: PageView.builder(
                  controller: controller.pageController,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: controller.onPageChanged,
                  itemCount: controller.items.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(controller.items[index].imagePath),
                          height: 246,
                          width: 246,
                        ),
                        const SizedBox(height: JSpace.space8),
                        Text(
                          controller.items[index].title,
                          style: JTStyle.title,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: JSpace.space16),
                        Text(
                          controller.items[index].description,
                          style: JTStyle.description,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: JSpace.space16),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: controller.pageController,
                    count: controller.items.length,
                    onDotClicked: (index) {
                      controller.pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    effect: const WormEffect(
                      dotHeight: 12,
                      dotWidth: 12,
                    ),
                  ),
                  const SizedBox(height: JSpace.space56 * 2),
                  Obx(
                    () => controller.currentIndex.value !=
                            controller.items.length - 1
                        ? SizedBox(
                            width: JHelper.getWidth(context)! * .9,
                            child: CustomBtnTwo(
                              function2: controller.nextButton,
                              function1: controller.skipButton,
                            ),
                          )
                        : CustomBtnOne(
                            function: controller.exploreBtn,
                            btnTite: 'Explore'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
