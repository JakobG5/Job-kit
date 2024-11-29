import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/common/widget/custom_btn1.dart';
import '../../../common/style/text_style.dart';
// import '../widget/otp_verification_field.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/space.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/helper/device_util.dart';
import '../controller/verification_controller.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerificationController(), permanent: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: JColors.background,
      body: SizedBox(
        height: JHelper.getHeight(context)! -
            JHelper.getAppBarHeight(context)! -
            MediaQuery.of(context).padding.top,
        width: JHelper.getWidth(context),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                const SizedBox(height: JSpace.space32),
                const Text(
                  JText.mainTitle,
                  style: JTStyle.header,
                ),
                const SizedBox(height: JSpace.space16),
                const Text(
                  'Verification Code',
                  style: JTStyle.title,
                ),
                const SizedBox(height: JSpace.space16),
                Text(
                  'Enter your verification code from your email or phone number thaw we\'ve sent.',
                  style:
                      JTStyle.description.copyWith(color: JColors.borderColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: JSpace.space56),
                // OtpVerificationField(),
                const SizedBox(height: JSpace.space56),
                CustomBtnOne(
                  function: controller.goToConfirmation,
                  btnTite: 'Verify',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
