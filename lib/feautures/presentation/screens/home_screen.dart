import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/feautures/presentation/controller/home_screen_controller.dart';
import 'package:job_kit/utils/constants/color.dart';
import '../../../common/style/text_style.dart';
import '../../../data/controller/file_picker_controller.dart';
import '../../../utils/constants/space.dart';
import '../widget/card_header_widget.dart';
import '../widget/drawer_widget.dart';
import '../widget/feautured_job_card_widget.dart';
import '../widget/popular_card.dart';
import '../widget/search_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController(), permanent: true);
    final fileController = Get.put(FilePickerController());
    return Scaffold(
      backgroundColor: JColors.background,
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Welcome to Jobseek!', style: JTStyle.appBarT),
            Text(
              'Discover Jobs',
              style: JTStyle.header.copyWith(
                color: JColors.blackBlue,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Stack(
              children: [
                InkWell(
                  onTap: fileController.pickImage,
                  child: Obx(
                    () => Container(
                      height: 54,
                      width: 54,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      // ignore: unnecessary_null_comparison
                      child: fileController.selectedImage.value == null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(54),
                              child: const Icon(Icons.person, size: 54),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(54),
                              child: Image.file(
                                fileController.selectedImage.value!,
                                fit: BoxFit.cover,
                                height: 54,
                                width: 54,
                              ),
                            ),
                    ),
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 0,
                  child: Container(
                    height: 16,
                    width: 16,
                    decoration: const BoxDecoration(
                      color: JColors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: drawer(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView(
            children: [
              const SizedBox(
                height: JSpace.space32,
              ),
              SearchWidget(
                controller: controller,
              ),
              const SizedBox(height: JSpace.space21),
              CardHeader(
                headerTitile: 'Feautured Jobs',
                function: controller.goToFeautured,
              ),
              const SizedBox(height: JSpace.space21),
              SizedBox(
                height: 190,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('jobs')
                        .snapshots(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                        itemCount: snapshot.data!.size,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final DocumentSnapshot jobDocument =
                              snapshot.data!.docs[index];
                          return FeauturedCard(
                            documentSnapshot: jobDocument,
                            componyName: jobDocument['componyNamee'],
                            exprianceLevel: jobDocument['employeeType'],
                            image: jobDocument['imagePath'],
                            jobCategory: jobDocument['field'],
                            jobDuration: jobDocument['duration'],
                            jobPosition: jobDocument['positionTitile'],
                            location:
                                '${jobDocument['location']['cityName']}, ${jobDocument['location']['countryName']}',
                            salary: jobDocument['salary'],
                          );
                        },
                      );
                    }),
              ),
              const SizedBox(
                height: JSpace.space32,
              ),
              CardHeader(
                headerTitile: 'Popular Jobs',
                function: controller.goToPopular,
              ),
              const SizedBox(height: JSpace.space21),
              StreamBuilder(
                  stream:
                      FirebaseFirestore.instance.collection('jobs').snapshots(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: snapshot.data!.size,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot jobDocumentPop =
                            snapshot.data!.docs[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: PopularCard(
                            componyName: jobDocumentPop['componyNamee'],
                            imagePath: jobDocumentPop['imagePath'],
                            jobTitile: jobDocumentPop['positionTitile'],
                            location:
                                '${jobDocumentPop['location']?['cityName'] ?? 'Unknown City'}, ${jobDocumentPop['location']?['countryName'] ?? 'Unknown Country'}',
                            salary: jobDocumentPop['salary'],
                          ),
                        );
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
