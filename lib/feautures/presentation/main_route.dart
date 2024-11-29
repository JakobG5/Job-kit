import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/feautures/presentation/controller/main_rote_controller.dart';
import '../../utils/constants/color.dart';

class MainRoute extends StatelessWidget {
  const MainRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RouteController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          elevation: 3,
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: JColors.deepBlue,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.message_rounded), label: 'Message'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), label: 'Bookmark'),
            BottomNavigationBarItem(
                icon: Icon(Icons.app_registration_outlined),
                label: 'Applicaiton'),
          ],
        ),
      ),
      body: Obx(
        () => controller.screens[controller.selectedIndex.value],
      ),
    );
  }
}
