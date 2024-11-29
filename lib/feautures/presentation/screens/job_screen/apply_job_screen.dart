import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/common/widget/custom_btn1.dart';
import '../../../../data/controller/file_picker_controller.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/space.dart';
import '../../../../utils/helper/device_util.dart';
import '../../../user/widget/file_list.dart';
import '../../widget/popular_card.dart';

class ApplyJob extends StatelessWidget {
  const ApplyJob({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FilePickerController());
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
              // const PopularCard(),
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
                return controller.resumeFiles.isEmpty
                    ? const Center(child: Text('No resume uploaded.'))
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.resumeFiles.length,
                        itemBuilder: (context, index) {
                          final file = controller.resumeFiles[index];
                          return FileListTile(
                            index: index,
                            file: file,
                            onDelete: () => controller.deleteFile(
                                controller.resumeFiles, file),
                          );
                        },
                      );
              }),
              const Spacer(),
              CustomBtnOne(function: () {}, btnTite: 'Apply'),
              const SizedBox(height: JSpace.space16),
            ],
          ),
        ),
      ),
    );
  }
}
