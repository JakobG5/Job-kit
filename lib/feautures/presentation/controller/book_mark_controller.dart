import 'package:get/get.dart';

class BookMarkController extends GetxController {
  // The list of bookmarked jobs
  var bookmarkedJobs = <Map<String, dynamic>>[].obs;

  // Singleton access
  static BookMarkController get instance => Get.find();

  // Method to add a job to the bookmark list
  void addToBookmark(Map<String, dynamic> job) {
    bookmarkedJobs.add(job);
  }
}
