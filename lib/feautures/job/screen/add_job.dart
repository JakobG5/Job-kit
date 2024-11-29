import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/utils/constants/space.dart';
import '../../../common/widget/custom_btn1.dart';
import '../controller/job_controller.dart';

class JobPost extends StatelessWidget {
  const JobPost({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(JobPostController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SafeArea(
          child: ListView(
            children: [
              const SizedBox(height: JSpace.space16),
              CustomBtnOne(
                  function: () async {
                    await controller.post();
                  },
                  btnTite: 'Post Job'),
              const SizedBox(height: JSpace.space16),
            ],
          ),
        ),
      ),
    );
  }
}
