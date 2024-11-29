import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/utils/constants/color.dart';
import '../../../common/style/text_style.dart';
import '../../../utils/constants/space.dart';
import '../controller/application_controler.dart';
import '../widget/application_status_card.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ApplicationControler());
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: JColors.background,
        title: Text(
          'Applications',
          style: JTStyle.header.copyWith(
            color: JColors.blackBlue,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: JColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: ListView(
          children: [
            const SizedBox(
              height: JSpace.space16,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'You have 3 Applications',
                style: JTStyle.appBarT
                    .copyWith(fontSize: 22, color: JColors.blackBlue),
              ),
            ),
            const SizedBox(
              height: JSpace.space16,
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: false,
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return Obx(
                      () => GestureDetector(
                        onTap: () {
                          controller.changeSelected(index);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(97),
                            color: controller.selectedIndex.value == index
                                ? JColors.drawerBtn
                                : JColors.white,
                          ),
                          child: Center(
                            child: Text(controller.btnTitle[index]),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(height: JSpace.space16),
            const ApplicationStatus(),
            const SizedBox(height: JSpace.space16),
            const ApplicationStatus(),
            const SizedBox(height: JSpace.space16),
            const ApplicationStatus(),
            const SizedBox(height: JSpace.space16),
            const ApplicationStatus(),
            const SizedBox(height: JSpace.space16),
            const ApplicationStatus(),
            const SizedBox(height: JSpace.space16),
          ],
        ),
      ),
    );
  }
}
