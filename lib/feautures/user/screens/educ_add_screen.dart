import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widget/custom_btn1.dart';
import '../../../common/widget/text_form_field.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/space.dart';
import '../../../utils/validators/validator.dart';
import '../controller/user_data_controller.dart';

class EduAddScreen extends StatelessWidget {
  const EduAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserDataController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Form(
            key: controller.keyEdu,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 50,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                const SizedBox(height: JSpace.space32),
                const Text('Educaiton'),
                const SizedBox(height: JSpace.space32),
                const Text('Title'),
                const SizedBox(height: JSpace.space8),
                CustomTextFormField(
                  controller: controller.titleEdu,
                  inputType: TextInputType.text,
                  isObscure: controller.isObscure,
                  label: '',
                  validator: (value) => Validator.validateName(value!),
                ),
                const SizedBox(height: JSpace.space32),
                const Text('Inistitution Name'),
                const SizedBox(height: JSpace.space8),
                CustomTextFormField(
                  controller: controller.instNameEdu,
                  inputType: TextInputType.text,
                  isObscure: controller.isObscure,
                  label: '',
                  validator: (value) => Validator.validateName(value!),
                ),
                const SizedBox(height: JSpace.space32),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        readOnly: true,
                        controller: controller.startDateEdu,
                        onTap: () => controller.selectDate(
                            context, controller.startDateEdu),
                        decoration: InputDecoration(
                            hintText: 'Start date',
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
                        controller: controller.endDateEdu,
                        onTap: () => controller.selectDate(
                            context, controller.endDateEdu),
                        decoration: InputDecoration(
                            hintText: 'End date',
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
                      if (controller.keyEdu.currentState!.validate() &&
                          controller.startDateEdu.text.isNotEmpty &&
                          controller.startDateEdu.text.isNotEmpty) {
                        controller.addEducation();
                        controller.resetFieldsEdu();
                        Get.back();
                      }
                    },
                    btnTite: 'Add')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
