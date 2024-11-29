import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/common/model/user/education.dart';
import 'package:job_kit/common/model/user/work_expriance.dart';
import 'package:job_kit/data/repository/autentication/firebase_auth_repository.dart';
import '../../../data/controller/file_picker_controller.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/space.dart';
import '../widget/file_list.dart';
import '../widget/header_card.dart';
import '../widget/user_edu_list.dart';
import '../widget/user_info.dart';
import '../widget/user_info_list.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fileController = Get.put(FilePickerController());
    return Scaffold(
      backgroundColor: JColors.background,
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .where('id',
                  isEqualTo:
                      AutenticationRepository.instance.firebaseUser.value!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final DocumentSnapshot userSnapshot = snapshot.data!.docs[0];
              final RxList<WorkExpriance> workExp = RxList(
                (userSnapshot['workExpriance'] as List).map((work) {
                  return WorkExpriance(
                    positionTitle: work['positionTitle'],
                    componyName: work['componyName'],
                    description: work['description'],
                    startDate: work['startDate'],
                    endDate: work['endDate'],
                  );
                }).toList(),
              );

              final RxList<Education> education = RxList(
                (userSnapshot['education'] as List).map((edu) {
                  return Education(
                    title: edu['title'],
                    inistitutionName: edu['inistitutionName'],
                    startDate: edu['startDate'],
                    endDate: edu['endDate'],
                  );
                }).toList(),
              );

              return Column(
                children: [
                  HeaderCard(
                    imagePath: userSnapshot['imagePath'],
                    location:
                        '${userSnapshot['location']['cityName']} ${userSnapshot['location']['countryName']}',
                    name:
                        '${userSnapshot['name']['first']} ${userSnapshot['name']['middle']} ${userSnapshot['name']['last']}',
                  ),
                  const SizedBox(height: JSpace.space8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        userDescription('Full Name',
                            '${userSnapshot['name']['first']} ${userSnapshot['name']['middle']} ${userSnapshot['name']['last']}'),
                        const SizedBox(height: JSpace.space16),
                        userDescription(
                            'Date of Birth', userSnapshot['dateOfBirth']),
                        const SizedBox(height: JSpace.space16),
                        userDescription('Email', userSnapshot['email']),
                        const SizedBox(height: JSpace.space16),
                        userDescription('Location',
                            '${userSnapshot['location']['cityName']} ${userSnapshot['location']['countryName']}'),
                        const SizedBox(height: JSpace.space16),
                        userExpriance('Work expriance', workExp),
                        const SizedBox(height: JSpace.space16),
                        userEducation('Educaiton', education),
                        const SizedBox(height: JSpace.space16),
                        const Text(
                          'Cv',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: JColors.blackBlue,
                          ),
                        ),
                        const SizedBox(height: JSpace.space16),
                        Obx(() {
                          return fileController.resumeFiles.isEmpty
                              ? Container(
                                  margin: const EdgeInsets.only(bottom: 8),
                                  decoration: BoxDecoration(
                                    color: JColors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 12),
                                  child: const Text('No resume uploaded.'))
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: fileController.resumeFiles.length,
                                  itemBuilder: (context, index) {
                                    final file =
                                        fileController.resumeFiles[index];
                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 8),
                                      decoration: BoxDecoration(
                                        color: JColors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 12),
                                      child: FileListTile(
                                        index: index,
                                        file: file,
                                        onDelete: () =>
                                            fileController.deleteFile(
                                                fileController.resumeFiles,
                                                file),
                                      ),
                                    );
                                  },
                                );
                        }),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text('Please fill your data'),
              );
            }
          },
        ),
      ),
    );
  }
}
