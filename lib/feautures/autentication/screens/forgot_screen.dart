import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/common/widget/custom_btn1.dart';
import 'package:job_kit/common/widget/text_form_field.dart';
import 'package:job_kit/feautures/autentication/controller/forgot_controller.dart';
import '../../../common/style/text_style.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/space.dart';
import '../../../utils/constants/text.dart';
import '../../../utils/helper/device_util.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotController(), permanent: true);
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
                  const Text('Forgot Password',
                      style: JTStyle.title, textAlign: TextAlign.center),
                  const SizedBox(height: JSpace.space8),
                  Text(
                    'Enter your email or phone number, we will send you verification code.',
                    style: JTStyle.description
                        .copyWith(color: JColors.borderColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: JSpace.space56),
                  Obx(
                    () => Container(
                      width: 294,
                      height: 50,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: JColors.containerBackground,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: controller.toggleEmail,
                            child: Container(
                              width: 134,
                              height: 36,
                              decoration: BoxDecoration(
                                color: controller.isEmailSelected.value
                                    ? JColors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Center(
                                child: Text('Email', style: JTStyle.subTitle),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: controller.tooglPassword,
                            child: Container(
                              width: 134,
                              height: 36,
                              decoration: BoxDecoration(
                                color: controller.isEmailSelected.value
                                    ? Colors.transparent
                                    : JColors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Center(
                                child: Text('Phone number',
                                    style: JTStyle.subTitle),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: JSpace.space16),
                  Obx(
                    () => Form(
                      key: controller.keyType[controller.selectedIndex.value],
                      child: CustomTextFormField(
                        controller: controller
                            .selectedField[controller.selectedIndex.value]
                            .controller,
                        inputType: controller
                            .selectedField[controller.selectedIndex.value]
                            .inputType,
                        isObscure: controller
                            .selectedField[controller.selectedIndex.value]
                            .isObscure,
                        label: controller
                            .selectedField[controller.selectedIndex.value]
                            .label,
                        validator: controller
                            .selectedField[controller.selectedIndex.value]
                            .validator,
                        prefixIcon: controller
                            .selectedField[controller.selectedIndex.value]
                            .prefixIcon,
                      ),
                    ),
                  ),
                  const Spacer(),
                  CustomBtnOne(
                      function: controller.goToVerificationScreen,
                      btnTite: 'Send Code'),
                  const SizedBox(height: JSpace.space16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
