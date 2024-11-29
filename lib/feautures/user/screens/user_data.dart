import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/common/widget/custom_btn1.dart';
import 'package:job_kit/feautures/user/controller/user_data_controller.dart';
import 'package:job_kit/feautures/user/widget/data1.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/space.dart';
import '../widget/data2.dart';

class UserData extends StatelessWidget {
  const UserData({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserDataController());
    return Scaffold(
      backgroundColor: JColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SafeArea(
          child: Column(
            children: [
              Obx(
                () => Expanded(
                  child: controller.currentIndex.value == 0
                      ? dataOne(context)
                      : dataTwo(context),
                ),
              ),
              const SizedBox(height: JSpace.space16),
              Obx(
                () => controller.currentIndex.value == 0
                    ? CustomBtnOne(
                        function: () {
                          controller.next();
                        },
                        btnTite: 'Next')
                    : ElevatedButton(
                        onPressed: () {
                          Get.snackbar(
                              'Button Pressed', 'You clicked the save button!',
                              snackPosition: SnackPosition.BOTTOM);
                          controller.saveData();
                        },
                        child: const Text('Save Data'),
                      ),
              ),
              const SizedBox(height: JSpace.space16),
            ],
          ),
        ),
      ),
    );
  }
}
