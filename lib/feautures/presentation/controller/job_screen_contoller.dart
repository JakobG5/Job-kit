import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controller/file_picker_controller.dart';
import '../../../data/repository/user/user_repository.dart';
import '../main_route.dart';
import '../screens/home_screen.dart';

class JobController extends GetxController {
  static JobController get instance => Get.find();
  final controller = Get.put(UserRepository());
  List<Widget> tabs = const [
    Tab(
      text: 'Description',
    ),
    Tab(
      text: 'Requirement',
    ),
    Tab(
      text: 'About',
    ),
    Tab(text: 'Reviews'),
  ];

  void applyForJob(String jobId) async {
    final fileController = Get.put(FilePickerController());

    if (fileController.resumeFiles.isEmpty) {
      Get.snackbar('No CV Uploaded', 'Please upload a CV before applying.');
      return;
    }

    try {
      print("Attempting to apply for job with id: $jobId");

      // Assuming applyJob is a method in UserRepository
      await controller.applyJob(jobId);

      print("Application submitted successfully!");
      Get.snackbar('Success', 'Application submitted successfully!');
      Get.off(() => MainRoute());
    } catch (e) {
      print("Failed to apply for the job: $e");
      Get.snackbar('Error', 'Failed to apply for the job: $e');
    }
  }
}
