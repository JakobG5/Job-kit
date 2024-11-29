import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/feautures/presentation/screens/application_screen.dart';
import 'package:job_kit/feautures/presentation/screens/book_mark_screen.dart';
import 'package:job_kit/feautures/presentation/screens/message.dart';
import '../screens/home_screen.dart';

class RouteController extends GetxController {
  static RouteController get instance => Get.find();

  Rx<int> selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  List<Widget> screens = [
    const HomeScreen(),
    const MessageScreen(),
    const BookMarkScreen(),
    const ApplicationScreen(),
  ];
}
