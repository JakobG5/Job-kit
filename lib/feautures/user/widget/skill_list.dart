import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:job_kit/common/model/user/string.dart';
import 'package:job_kit/common/widget/custom_btn1.dart';
import 'package:job_kit/feautures/user/controller/user_data_controller.dart';
// import 'package:job_kit/feautures/user/controller/user_data_controller.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/space.dart';

Widget skillList(List<Map<String, dynamic>> list) {
  final controller = Get.put(UserDataController());
  return SizedBox(
    height: 400,
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Wrap(
          children: list.map((e) {
            return GestureDetector(
              onTap: () => e['isSelected'].value = !e['isSelected'].value,
              child: Obx(
                () => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: JColors.white, // Default background color
                    boxShadow: e['isSelected'].value
                        ? [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: const Offset(0, 3), // Shadow direction
                            ),
                          ]
                        : [],
                  ),
                  child: Text(e['name']),
                ),
              ),
            );
          }).toList(),
        ),
        CustomBtnOne(
          function: () {
            controller.addSelectedSkills(); // Call controller to add skills
            Get.back(); // Navigate back to the previous screen
          },
          btnTite: 'Add',
        ),
        const SizedBox(height: JSpace.space8),
      ],
    ),
  );
}
