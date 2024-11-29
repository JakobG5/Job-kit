import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/feautures/user/controller/user_data_controller.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/space.dart';
import '../screens/educ_add_screen.dart';
import '../screens/work_exp_add.dart';
import 'user_edu_list.dart';
import 'user_info_list.dart';
import 'wrap.dart';

Widget dataTwo(BuildContext context) {
  final controller = Get.put(UserDataController());
  return Form(
      key: controller.key2,
      child: ListView(
        children: [
          const SizedBox(height: JSpace.space16),
          const Text(
            'Education',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: JColors.blackBlue,
            ),
          ),
          const SizedBox(height: JSpace.space8),
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: JColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Add Educational qualification'),
                IconButton(
                  onPressed: () => Get.to(const EduAddScreen()),
                  icon: const Icon(Icons.add),
                )
              ],
            ),
          ),
          const SizedBox(height: JSpace.space8),
          userEducation('', controller.education),
          const SizedBox(height: JSpace.space32),
          const Text(
            'Work Expriance',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: JColors.blackBlue,
            ),
          ),
          const SizedBox(height: JSpace.space8),
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: JColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Add Work Expriance'),
                IconButton(
                  onPressed: () => Get.to(const WorkExprianceAdd()),
                  icon: const Icon(Icons.add),
                )
              ],
            ),
          ),
          const SizedBox(height: JSpace.space8),
          userExpriance('', controller.expriance),
          const SizedBox(height: JSpace.space32),
          const Text(
            'Skills',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: JColors.blackBlue,
            ),
          ),
          const SizedBox(height: JSpace.space8),
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
              color: JColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Add Skills'),
                IconButton(
                  onPressed: () => controller.addSkills(context),
                  icon: const Icon(Icons.add),
                )
              ],
            ),
          ),
          const SizedBox(height: JSpace.space32),
          wrap(controller.skills),
        ],
      ));
}
