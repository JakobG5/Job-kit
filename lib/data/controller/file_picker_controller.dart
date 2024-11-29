import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

import '../repository/autentication/firebase_auth_repository.dart';

class FilePickerController extends GetxController {
  static FilePickerController get instance => Get.find();

  final ImagePicker _imagePicker = ImagePicker();

  // Observables to hold uploaded files
  final Rx<File?> selectedImage = Rx<File?>(null);
  final Rx<File?> selectedImageJob = Rx<File?>(null);
  final RxList<File> resumeFiles = <File>[].obs;
  final RxList<File> coverLetterFiles = <File>[].obs;

  late final String url;

  // Method to pick an image
  Future<void> pickImage() async {
    try {
      final XFile? pickedImage = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (pickedImage != null) {
        selectedImage.value = File(pickedImage.path);

        // Upload the image to Firebase Storage
        await uploadImage();

        // Get the current user ID
        final userId = AutenticationRepository.instance.firebaseUser.value?.uid;

        if (userId != null) {
          // Update Firestore with the new image URL
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .update({
            'imagePath': url, // URL is set during the upload process
          });

          Get.snackbar('Success', 'Profile picture updated successfully!');
        }
      } else {
        Get.snackbar('No Image Selected', 'Please select an image file.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  Future<void> uploadImage() async {
    try {
      final file = selectedImage.value;
      if (file == null) {
        Get.snackbar('Error', 'No file selected.');
        return;
      }

      final userId = AutenticationRepository.instance.firebaseUser.value?.uid;
      if (userId == null) {
        Get.snackbar('Error', 'User not logged in.');
        return;
      }

      final fileName = '${userId}_profile.jpg';
      final destinationPath = 'users/$fileName';

      final ref = FirebaseStorage.instance.ref().child(destinationPath);
      final uploadTask = ref.putFile(file);

      final snapshot = await uploadTask.whenComplete(() {});
      url = await snapshot.ref.getDownloadURL(); // Update the global `url`
    } catch (e) {
      Get.snackbar('Error', 'Failed to upload image: $e');
    }
  }

  Future<void> pickImageJob() async {
    try {
      final XFile? pickedImage = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (pickedImage != null) {
        selectedImageJob.value = File(pickedImage.path);
      } else {
        Get.snackbar('No Image Selected', 'Please select an image file.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  // Method to pick a resume file
  Future<void> pickResume() async {
    if (resumeFiles.isNotEmpty) {
      Get.snackbar('CV Already Uploaded', 'You have already uploaded a CV.');
      return;
    }

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );

      if (result != null && result.files.single.path != null) {
        resumeFiles.add(File(result.files.single.path!));
      } else {
        Get.snackbar('No File Selected', 'Please select a valid resume file.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick CV: $e');
    }
  }

  // Method to pick a cover letter file
  Future<void> pickCoverLetter() async {
    await _pickDocument(coverLetterFiles, 'cover letter');
  }

  // General method to pick a PDF or .doc file and add to specified list
  Future<void> _pickDocument(RxList<File> targetList, String type) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );

      if (result != null && result.files.single.path != null) {
        targetList.add(File(result.files.single.path!));
      } else {
        Get.snackbar('No File Selected', 'Please select a valid $type file.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick file: $e');
    }
  }

  // Method to delete a specific file from a list
  void deleteFile(RxList<File> targetList, File file) {
    targetList.remove(file);
  }

  // Method to clear selections
  void clearSelections() {
    selectedImage.value = null;
    resumeFiles.clear();
    coverLetterFiles.clear();
  }
}
