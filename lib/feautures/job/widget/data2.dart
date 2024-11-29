import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/common/widget/custom_btn1.dart';
import 'package:job_kit/utils/constants/space.dart';

import '../../../common/widget/comment_text_formField.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/validators/validator.dart';

Widget requirementsModal(BuildContext context) {
  final describtion = TextEditingController();
  final point1 = TextEditingController();
  final point2 = TextEditingController();
  final point3 = TextEditingController();
  RxBool isObscure = false.obs;

  // void resetFields() {
  //   describtion.clear();
  //   point1.clear();
  //   point2.clear();
  //   point3.clear();
  // }

  // void addRequirement() {
  //   if (controller.formTwo.currentState!.validate()) {
  //     controller.jobRequirement = JobDetail(
  //       header: describtion.text,
  //       points: [
  //         StringList(id: '1', content: point1.text),
  //         StringList(id: '2', content: point2.text),
  //         StringList(id: '3', content: point3.text),
  //       ],
  //     );
  //     resetFields();
  //     print(controller.jobRequirement);
  //   } else {
  //     return;
  //   }
  // }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Form(
      // key: controller.formTwo,
      child: ListView(
        children: [
          const SizedBox(height: JSpace.space8),
          Center(
            child: Container(
              width: 60,
              height: 5,
              decoration: BoxDecoration(
                color: JColors.greyMuted,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(height: JSpace.space32),
          CustomMultiLineTF(
            controller: describtion,
            isObscure: isObscure,
            label: 'describe general requirements...',
            validator: (val) => Validator.validateDescription(val!),
          ),
          const SizedBox(height: JSpace.space32),
          CustomMultiLineTF(
            controller: point1,
            isObscure: isObscure,
            label: 'Educational reuirements...',
            validator: (val) => Validator.validateDescription(val!),
          ),
          const SizedBox(height: JSpace.space32),
          CustomMultiLineTF(
            controller: point2,
            isObscure: isObscure,
            label: 'EWork Expriance...',
            validator: (val) => Validator.validateDescription(val!),
          ),
          const SizedBox(height: JSpace.space32),
          CustomMultiLineTF(
            controller: point3,
            isObscure: isObscure,
            label: 'Other...',
            validator: (val) => Validator.validateDescription(val!),
          ),
          const SizedBox(height: JSpace.space32),
          CustomBtnOne(function: () {}, btnTite: 'Save')
        ],
      ),
    ),
  );
}
