import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/common/widget/custom_btn1.dart';
import '../../../common/style/text_style.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/space.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/helper/device_util.dart';
import '../controller/confirmation_controller.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ConfirmationController(), permanent: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: JColors.background,
      body: SingleChildScrollView(
        child: SizedBox(
          height: JHelper.getHeight(context)! -
              JHelper.getAppBarHeight(context)! -
              MediaQuery.of(context).padding.top,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: JSpace.space32),
              const Text(
                JText.mainTitle,
                style: JTStyle.header,
              ),
              const SizedBox(height: JSpace.space32),
              const Image(
                image: AssetImage('asset/confirmation.jpg'),
                height: 246,
                width: 246,
              ),
              const SizedBox(height: JSpace.space8),
              const Text('Confirmation', style: JTStyle.title),
              const SizedBox(height: JSpace.space8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'Your passowrd has been changed. Please log in with your new password.',
                  style:
                      JTStyle.description.copyWith(color: JColors.borderColor),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              CustomBtnOne(
                function: controller.goToLogin,
                btnTite: 'Log in',
              ),
              const SizedBox(height: JSpace.space32),
            ],
          ),
        ),
      ),
    );
  }
}
