import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/feautures/presentation/controller/home_screen_controller.dart';
import 'package:job_kit/utils/constants/color.dart';
import '../../../common/style/text_style.dart';
import '../../../data/controller/file_picker_controller.dart';
import '../../../data/repository/autentication/firebase_auth_repository.dart';
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
    final controller = Get.put(HomeScreenController());
    return Scaffold(
      backgroundColor: JColors.background,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Welcome to Jobseek!', style: JTStyle.appBarT),
            Text(
              'Discover Jobs',
              style: JTStyle.header.copyWith(color: JColors.blackBlue),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Stack(
              children: [
                InkWell(
                  onTap: () => Get.find<FilePickerController>().pickImage(),
                  child: Obx(() => StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .where(
                              'id',
                              isEqualTo: AutenticationRepository
                                  .instance.firebaseUser.value!.uid,
                            )
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator(); //
                          }

                          if (snapshot.hasError) {
                            return const Icon(
                              Icons.error,
                              size: 104,
                              color: Colors.red,
                            );
                          }

                          if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(54),
                              child: const Icon(
                                Icons.person,
                                size: 40,
                              ),
                            );
                          }

                          final DocumentSnapshot userSnapshot =
                              snapshot.data!.docs[0];
                          final imagePath =
                              userSnapshot['imagePath'] as String?;

                          return ClipRRect(
                            borderRadius: BorderRadius.circular(104),
                            child: imagePath == null || imagePath.isEmpty
                                ? const Icon(Icons.person, size: 104)
                                : Image.network(
                                    imagePath,
                                    fit: BoxFit.cover,
                                    height: 40,
                                    width: 40,
                                  ),
                          );
                        },
                      )),
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
                    child: const Center(
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.red,
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
              const SizedBox(height: JSpace.space32),
              SearchWidget(controller: controller),
              const SizedBox(height: JSpace.space21),
              CardHeader(
                headerTitile: 'Featured Jobs',
                function: controller.goToFeautured,
              ),
              const SizedBox(height: JSpace.space21),
              SizedBox(
                height: 190,
                child: StreamBuilder<QuerySnapshot>(
                  stream:
                      FirebaseFirestore.instance.collection('jobs').snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return const Center(child: Text('Error loading jobs.'));
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(
                          child: Text('No featured jobs found.'));
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final job = snapshot.data!.docs[index];
                        return FeauturedCard(
                          documentSnapshot: job,
                          componyName: job['componyNamee'] ?? 'Unknown Company',
                          exprianceLevel: job['employeeType'] ?? 'N/A',
                          image: job['imagePath'] ?? '',
                          jobCategory: job['field'] ?? 'N/A',
                          jobDuration: job['duration'] ?? 'N/A',
                          jobPosition: job['positionTitile'] ?? 'N/A',
                          location:
                              '${job['location']?['cityName'] ?? 'Unknown City'}, ${job['location']?['countryName'] ?? 'Unknown Country'}',
                          salary: job['salary'] ?? 'N/A',
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: JSpace.space32),
              CardHeader(
                headerTitile: 'Popular Jobs',
                function: controller.goToPopular,
              ),
              const SizedBox(height: JSpace.space21),
              StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('jobs').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return const Center(child: Text('Error loading jobs.'));
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No popular jobs found.'));
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final job = snapshot.data!.docs[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        child: PopularCard(
                          componyName: job['componyNamee'] ?? 'Unknown Company',
                          imagePath: job['imagePath'] ?? '',
                          jobTitile: job['positionTitile'] ?? 'N/A',
                          location:
                              '${job['location']?['cityName'] ?? 'Unknown City'}, ${job['location']?['countryName'] ?? 'Unknown Country'}',
                          salary: job['salary'] ?? 'N/A',
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
