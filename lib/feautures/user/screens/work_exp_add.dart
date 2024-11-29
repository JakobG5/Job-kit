import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/feautures/user/controller/user_data_controller.dart';
import '../../../common/widget/comment_text_formField.dart';
import '../../../common/widget/custom_btn1.dart';
import '../../../common/widget/text_form_field.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/space.dart';
import '../../../utils/validators/validator.dart';

class WorkExprianceAdd extends StatelessWidget {
  const WorkExprianceAdd({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserDataController());
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Form(
              key: controller.key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Work Experience'),
                  const SizedBox(height: JSpace.space32),
                  const Text('Company Name'),
                  const SizedBox(height: JSpace.space8),
                  CustomTextFormField(
                    controller: controller.companyName,
                    inputType: TextInputType.text,
                    isObscure: controller.isObscure,
                    label: '',
                    validator: (value) => Validator.validateName(value!),
                  ),
                  const SizedBox(height: JSpace.space32),
                  const Text('Position'),
                  const SizedBox(height: JSpace.space8),
                  CustomTextFormField(
                    controller: controller.title,
                    inputType: TextInputType.text,
                    isObscure: controller.isObscure,
                    label: '',
                    validator: (value) => Validator.validateName(value!),
                  ),
                  const SizedBox(height: JSpace.space32),
                  CustomMultiLineTF(
                    controller: controller.description,
                    isObscure: controller.isObscure,
                    label: 'Description',
                    validator: (value) => Validator.validateName(value!),
                  ),
                  const SizedBox(height: JSpace.space32),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          controller: controller.startDate,
                          onTap: () => controller.selectDate(
                              context, controller.startDate),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: JColors.borderColor,
                                  )),
                              filled: true,
                              hintStyle: const TextStyle(
                                color: JColors.borderColor,
                                fontSize: 14,
                              ),
                              fillColor: JColors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: JColors.black,
                                    width: 1,
                                  ))),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          controller: controller.endDate,
                          onTap: () => controller.selectDate(
                              context, controller.endDate),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: JColors.borderColor,
                                  )),
                              filled: true,
                              hintStyle: const TextStyle(
                                color: JColors.borderColor,
                                fontSize: 14,
                              ),
                              fillColor: JColors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: JColors.black,
                                    width: 1,
                                  ))),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: JSpace.space32),
                  CustomBtnOne(
                    function: () {
                      if (controller.key.currentState!.validate() &&
                          controller.startDate.text.isNotEmpty &&
                          controller.endDate.text.isNotEmpty) {
                        controller.addExperience();
                        controller.resetFields();
                        Get.back();
                      }
                    },
                    btnTite: 'Add',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
