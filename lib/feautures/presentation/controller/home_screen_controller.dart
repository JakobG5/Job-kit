import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/see_all_feautured.dart';
import '../screens/see_all_popular.dart';
import '../widget/search_modal.dart';

class HomeScreenController extends GetxController {
  static HomeScreenController get instance => Get.find();
  final search = TextEditingController();
  RxBool defaultVisi = false.obs;

  void goToFeautured() {
    Get.to(const FeauturedJobAll());
  }

  void goToPopular() {
    Get.to(const PopularJobAll());
  }

  Future<dynamic> searchModal(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      builder: (ctx) => SearchModal(),
      useSafeArea: true,
      isScrollControlled: true,
    );
  }
}
