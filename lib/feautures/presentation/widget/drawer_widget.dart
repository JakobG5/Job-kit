import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/data/repository/autentication/firebase_auth_repository.dart';
import 'package:job_kit/feautures/presentation/screens/application_screen.dart';
import 'package:job_kit/feautures/presentation/screens/setting.dart';

import '../../../common/style/text_style.dart';
import '../../../common/widget/custom_btn1.dart';
import '../../../data/controller/file_picker_controller.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/space.dart';
import '../../../utils/helper/device_util.dart';
import '../../job/screen/post_job.dart';
import '../../user/screens/upload_file.dart';
import '../../user/screens/user_profile_screen.dart';

Widget drawer(BuildContext context) {
  final fileController = Get.put(FilePickerController());
  return Drawer(
    backgroundColor: JColors.background,
    child: SizedBox(
      height: JHelper.getHeight(context),
      child: Column(
        children: [
          SizedBox(
            height: JHelper.getHeight(context)! * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: JSpace.space16,
                ),
                SizedBox(
                  height: 104,
                  width: 104,
                  child: Stack(
                    children: [
                      Obx(
                        () => Container(
                          height: 104,
                          width: 104,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: fileController.selectedImage.value == null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(54),
                                  child: const Icon(Icons.person, size: 104),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(104),
                                  child: Image.file(
                                    fileController.selectedImage.value!,
                                    fit: BoxFit.cover,
                                    height: 104,
                                    width: 104,
                                  ),
                                ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: fileController.pickImage,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              color: JColors.background,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: JColors.greyMuted,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Yakob Girma',
                  style: JTStyle.drawerTitle,
                ),
                const Text(
                  'Flutter Developer',
                  maxLines: 1,
                  style: JTStyle.drawerSubTitle,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.info_outlined,
              color: JColors.borderColor,
            ),
            title: const Text(
              'Personal Info',
              style: JTStyle.subTitle,
            ),
            onTap: () {
              Get.to(const UserProfileScreen());
            },
          ),
          const SizedBox(height: 4),
          ListTile(
            leading: const Icon(
              Icons.settings_applications_rounded,
              color: JColors.borderColor,
            ),
            title: const Text(
              'Applications',
              style: JTStyle.subTitle,
            ),
            onTap: () {
              Get.to(const ApplicationScreen());
            },
          ),
          const SizedBox(height: 4),
          ListTile(
            leading: const Icon(
              Icons.task_rounded,
              color: JColors.borderColor,
            ),
            title: const Text(
              'Posted Jobs',
              style: JTStyle.subTitle,
            ),
            onTap: () {
              Get.to(const Job());
            },
          ),
          const SizedBox(height: 4),
          const SizedBox(height: 4),
          ListTile(
            leading: const Icon(
              Icons.settings_applications_rounded,
              color: JColors.borderColor,
            ),
            title: const Text(
              'CV',
              style: JTStyle.subTitle,
            ),
            onTap: () {
              Get.to(UploadFileScreen());
            },
          ),
          const SizedBox(height: 4),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: JColors.borderColor,
            ),
            title: const Text(
              'Settings',
              style: JTStyle.subTitle,
            ),
            onTap: () {
              Get.to(const SettingsScren());
            },
          ),
          const SizedBox(height: 4),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Color(0xFFE30000),
            ),
            title: Text(
              'Log out',
              style: JTStyle.subTitle.copyWith(color: const Color(0xFFE30000)),
            ),
            onTap: () {
              AutenticationRepository.instance.logout();
            },
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CustomBtnOne(
              function: () {},
              btnTite: 'Go Premium',
            ),
          ),
          const SizedBox(
            height: JSpace.space16,
          ),
        ],
      ),
    ),
  );
}
