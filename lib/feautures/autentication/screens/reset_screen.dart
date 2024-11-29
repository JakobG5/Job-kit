import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/common/widget/custom_btn1.dart';
import 'package:job_kit/common/widget/text_form_field.dart';
import '../../../common/style/text_style.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/space.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/helper/device_util.dart';
import '../../../utils/validators/validator.dart';
import '../controller/reset_controller.dart';

class ResetScreen extends StatelessWidget {
  const ResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetController(), permanent: true);
    return Scaffold(
      backgroundColor: JColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: JHelper.getHeight(context)! -
              JHelper.getAppBarHeight(context)! -
              MediaQuery.of(context).padding.top,
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
                    'Reset Password',
                    style: JTStyle.title,
                  ),
                  const SizedBox(height: JSpace.space16),
                  Text(
                    'Enter your new password and confirm the new password to reset password.',
                    style: JTStyle.description
                        .copyWith(color: JColors.borderColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: JSpace.space56),
                  CustomTextFormField(
                    controller: controller.passwordController,
                    inputType: TextInputType.text,
                    isObscure: controller.isVisible,
                    label: 'New Password',
                    suffixTrue: Icons.visibility_off,
                    suffixFalse: Icons.visibility,
                    prefixIcon: Icons.password,
                    toogleVisibility: controller.toogleVisibility,
                    validator: (value) => Validator.validatePassword(value!),
                  ),
                  const SizedBox(height: JSpace.space8),
                  CustomTextFormField(
                    controller: controller.confirmPassword,
                    inputType: TextInputType.text,
                    isObscure: controller.isVisible,
                    label: 'Confirm New Password',
                    suffixTrue: Icons.visibility_off,
                    suffixFalse: Icons.visibility,
                    prefixIcon: Icons.password,
                    toogleVisibility: controller.toogleVisibility,
                    validator: (value) => Validator.confirmPassword(
                      value!,
                      controller.passwordController.text.trim(),
                    ),
                  ),
                  const Spacer(),
                  CustomBtnOne(function: () {}, btnTite: 'Reset Password'),
                  const SizedBox(height: JSpace.space32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
