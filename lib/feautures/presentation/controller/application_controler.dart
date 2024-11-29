import 'package:get/get.dart';

class ApplicationControler extends GetxController {
  static ApplicationControler get instance => Get.find();

  List<String> btnTitle = [
    'All',
    'Delivered',
    'Reviewing',
    'Cancled',
  ];

  RxInt selectedIndex = 0.obs;

  void changeSelected(int value) {
    selectedIndex.value = value;
  }
}
