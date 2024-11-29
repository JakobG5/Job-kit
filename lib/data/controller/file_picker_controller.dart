import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class FilePickerController extends GetxController {
  static FilePickerController get instance => Get.find();

  final ImagePicker _imagePicker = ImagePicker();

  // Observables to hold uploaded files
  final Rx<File?> selectedImage = Rx<File?>(null);
  final Rx<File?> selectedImageJob = Rx<File?>(null);
  final RxList<File> resumeFiles = <File>[].obs;
  final RxList<File> coverLetterFiles = <File>[].obs;

  // Method to pick an image
  Future<void> pickImage() async {
    try {
      final XFile? pickedImage = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );

      if (pickedImage != null) {
        selectedImage.value = File(pickedImage.path);
      } else {
        Get.snackbar('No Image Selected', 'Please select an image file.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
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
    await _pickDocument(resumeFiles, 'resume');
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
