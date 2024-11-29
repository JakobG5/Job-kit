import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobController extends GetxController {
  static JobController get instance => Get.find();
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
}
