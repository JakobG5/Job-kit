import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/feautures/autentication/widget/or_sign_in_with.dart';
import 'package:job_kit/common/widget/text_form_field.dart';
import '../../../common/style/text_style.dart';
import '../../../common/widget/custom_btn1.dart';
import '../widget/social_media.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/space.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/helper/device_util.dart';
import '../../../utils/validators/validator.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController(), permanent: true);
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
          child: SafeArea(
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
                    'Welcome Back',
                    style: JTStyle.description2,
                  ),
                  const SizedBox(height: JSpace.space8),
                  const Text(
                    'Let\'s log in, Apply to jobs!',
                    style: JTStyle.subTitle,
                  ),
                  const SizedBox(height: JSpace.space32),
                  Form(
                    key: controller.loginKey,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: controller.emailController,
                          inputType: TextInputType.emailAddress,
                          isObscure: controller.defaultVisibility,
                          label: 'Enter your email',
                          validator: (value) => Validator.validateEmail(value!),
                          prefixIcon: Icons.email,
                        ),
                        const SizedBox(height: JSpace.space16),
                        CustomTextFormField(
                          controller: controller.passwordController,
                          inputType: TextInputType.text,
                          isObscure: controller.isVisible,
                          label: 'password',
                          validator: (value) =>
                              Validator.validatePassword(value!),
                          prefixIcon: Icons.password,
                          toogleVisibility: controller.toogleVisibility,
                          suffixFalse: Icons.visibility,
                          suffixTrue: Icons.visibility_off,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: JSpace.space32),
                  CustomBtnOne(
                    btnTite: 'Log in',
                    function: controller.login,
                  ),
                  const SizedBox(height: JSpace.space32 * 2),
                  Center(
                    child: GestureDetector(
                      onTap: () => controller.goToForgetPassword(),
                      child: Text(
                        'forgot Password?',
                        style: JTStyle.btnTitle.copyWith(
                          color: JColors.darkBlue,
                        ),
                      ),
                    ),
                  ),
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
                        'Have\'t have an  account? ',
                        style: TextStyle(color: JColors.borderColor),
                      ),
                      GestureDetector(
                        onTap: controller.goToRegister,
                        child: const Text(
                          'Register ',
                          style: TextStyle(color: JColors.deepBlue),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: JSpace.space21),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
