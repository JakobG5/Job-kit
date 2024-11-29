import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/space.dart';
import '../../autentication/screens/reset_screen.dart';

class SettingsScren extends StatelessWidget {
  const SettingsScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JColors.background,
      appBar: AppBar(
        backgroundColor: JColors.background,
        title: const Text(
          'settings',
          style: TextStyle(
            fontSize: 24,
            color: JColors.blackBlue,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: JSpace.space16),
                const Text(
                  'Applications',
                  style: TextStyle(
                    color: JColors.greyMuted,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: JSpace.space16),
                const ListTile(
                  leading: Icon(
                    Icons.notifications,
                    color: JColors.greyMuted,
                  ),
                  title: Text(
                    'Notification',
                    style: TextStyle(color: JColors.blackBlue, fontSize: 14),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.password_outlined,
                    color: JColors.greyMuted,
                  ),
                  title: const Text(
                    'Change Password',
                    style: TextStyle(color: JColors.blackBlue, fontSize: 14),
                  ),
                  onTap: () {
                    Get.to(const ResetScreen());
                  },
                ),
                const ListTile(
                  leading: Icon(
                    Icons.delete_forever_outlined,
                    color: JColors.red,
                  ),
                  title: Text(
                    'Delete Account',
                    style: TextStyle(color: JColors.red, fontSize: 14),
                  ),
                ),
                const SizedBox(height: JSpace.space16),
                const Text(
                  'About',
                  style: TextStyle(
                    color: JColors.greyMuted,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: JSpace.space16),
                const ListTile(
                  leading: Icon(
                    Icons.privacy_tip,
                    color: JColors.greyMuted,
                  ),
                  title: Text(
                    'Privacy',
                    style: TextStyle(color: JColors.blackBlue, fontSize: 14),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.low_priority_sharp,
                    color: JColors.greyMuted,
                  ),
                  title: Text(
                    'Terms and Condition',
                    style: TextStyle(color: JColors.blackBlue, fontSize: 14),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.help_center_outlined,
                    color: JColors.greyMuted,
                  ),
                  title: Text(
                    'Help Center',
                    style: TextStyle(color: JColors.blackBlue, fontSize: 14),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.support_agent,
                    color: JColors.greyMuted,
                  ),
                  title: Text(
                    'Support',
                    style: TextStyle(color: JColors.blackBlue, fontSize: 14),
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.question_mark_rounded,
                    color: JColors.red,
                  ),
                  title: Text(
                    'About',
                    style: TextStyle(color: JColors.blackBlue, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
