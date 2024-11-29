import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/common/widget/custom_btn1.dart';
import '../../../../data/controller/file_picker_controller.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/space.dart';
import '../../../../utils/helper/device_util.dart';
import '../../../user/widget/file_list.dart';
import '../../controller/job_screen_contoller.dart';
import '../../widget/popular_card.dart';

class ApplyJob extends StatelessWidget {
  final String componyName;
  final String imgPath;
  final String jobTitle;
  final String location;
  final String salary;
  final String id;
  const ApplyJob({
    super.key,
    required this.id,
    required this.componyName,
    required this.imgPath,
    required this.jobTitle,
    required this.location,
    required this.salary,
  });

  @override
  Widget build(BuildContext context) {
    final filecontroller = Get.put(FilePickerController());
    final controller = Get.put(JobController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apply'),
        centerTitle: true,
      ),
      backgroundColor: JColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: SizedBox(
          height: JHelper.getHeight(context)! -
              JHelper.getAppBarHeight(context)! -
              MediaQuery.of(context).padding.top,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: JSpace.space16),
              PopularCard(
                componyName: componyName,
                imagePath: imgPath,
                jobTitile: jobTitle,
                location: location,
                salary: salary,
              ),
              const SizedBox(height: JSpace.space32),
              const Text(
                'Select Cv',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: JSpace.space32),
              Obx(() {
                return filecontroller.resumeFiles.isEmpty
                    ? const Center(child: Text('No resume uploaded.'))
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: filecontroller.resumeFiles.length,
                        itemBuilder: (context, index) {
                          final file = filecontroller.resumeFiles[index];
                          return FileListTile(
                            index: index,
                            file: file,
                            onDelete: () => filecontroller.deleteFile(
                                filecontroller.resumeFiles, file),
                          );
                        },
                      );
              }),
              const Spacer(),
              CustomBtnOne(
                function: () => controller.applyForJob(id),
                btnTite: 'Apply',
              ),
              const SizedBox(height: JSpace.space16),
            ],
          ),
        ),
      ),
    );
  }
}
