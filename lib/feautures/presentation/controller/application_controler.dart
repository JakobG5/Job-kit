import 'package:get/get.dart';

class ApplicationControler extends GetxController {
  static ApplicationControler get instance => Get.find();

  List<String> btnTitle = [
    'All',
    'Delivered',
    'Reviewing',
    'Canceled', // Corrected typo here
  ];

  RxInt selectedIndex = 0.obs;

  RxList<dynamic> filteredApplications =
      <dynamic>[].obs; // List to store filtered applications

  // Method to change the selected index
  void changeSelected(int value) {
    selectedIndex.value = value;
  }

  // Method to filter applications based on the selected status
  void filterApplications(List<dynamic> applications) {
    if (selectedIndex.value == 0) {
      filteredApplications.value = applications; // Show all applications
    } else {
      filteredApplications.value = applications.where((application) {
        switch (selectedIndex.value) {
          case 1: // Delivered
            return application['status'] == 'Delivered';
          case 2: // Reviewing
            return application['status'] == 'Reviewing';
          case 3: // Canceled
            return application['status'] == 'Canceled';
          default:
            return false;
        }
      }).toList();
    }
    // Make sure to check if filteredApplications is populated correctly
    print('Filtered Applications: ${filteredApplications.length}');
  }
}
