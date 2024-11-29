import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/common/widget/custom_btn1.dart';
import 'package:job_kit/common/widget/text_form_field.dart';
import '../../../common/style/text_style.dart';
import '../widget/or_sign_in_with.dart';
import '../widget/social_media.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/space.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/helper/device_util.dart';
import '../../../utils/validators/validator.dart';
import '../controller/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController(), permanent: true);
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      backgroundColor: JColors.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height:
                JHelper.getHeight(context)! - JHelper.getAppBarHeight(context)!,
            width: JHelper.getWidth(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: JSpace.space21),
                  const Text(
                    JText.mainTitle,
                    style: JTStyle.header,
                  ),
                  const SizedBox(height: JSpace.space8),
                  const Text(
                    JText.description,
                    style: JTStyle.description2,
                  ),
                  const SizedBox(height: JSpace.space8),
                  const Text(
                    JText.subDescription,
                    style: JTStyle.subTitle,
                  ),
                  const SizedBox(height: JSpace.space32),
                  Form(
                    key: controller.registerKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: controller.emailController,
                          inputType: TextInputType.emailAddress,
                          isObscure: controller.defaultVisibility,
                          label: 'E-mail',
                          prefixIcon: Icons.email,
                          validator: (value) => Validator.validateEmail(value!),
                        ),
                        const SizedBox(height: JSpace.space16),
                        CustomTextFormField(
                          controller: controller.passwordController,
                          inputType: TextInputType.text,
                          isObscure: controller.isVisible,
                          label: 'password',
                          prefixIcon: Icons.password,
                          validator: (value) =>
                              Validator.validatePassword(value!),
                          suffixFalse: Icons.visibility,
                          suffixTrue: Icons.visibility_off,
                          toogleVisibility: controller.toogleVisibility,
                        ),
                        const SizedBox(height: JSpace.space16),
                        CustomTextFormField(
                          controller: controller.confirmPasswordController,
                          inputType: TextInputType.text,
                          isObscure: controller.isVisible,
                          label: 'confirm password',
                          prefixIcon: Icons.password,
                          validator: (value) => Validator.confirmPassword(
                              value!, controller.passwordController.text),
                          suffixFalse: Icons.visibility,
                          suffixTrue: Icons.visibility_off,
                          toogleVisibility: controller.toogleVisibility,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: JSpace.space32),
                  CustomBtnOne(
                      function: controller.register, btnTite: 'Register'),
                  const SizedBox(height: JSpace.space32),
                  const SignWith(),
                  const SizedBox(height: JSpace.space32),
                  const SocialMediaRegister(),
                  const SizedBox(height: JSpace.space32),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Have an account? ',
                        style: TextStyle(color: JColors.borderColor),
                      ),
                      GestureDetector(
                        onTap: controller.goToLogin,
                        child: const Text(
                          'Login ',
                          style: TextStyle(color: JColors.deepBlue),
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(height: JSpace.space8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
