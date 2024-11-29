import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/data/repository/user/user_repository.dart';
import 'package:job_kit/utils/constants/color.dart';
import '../../../common/style/text_style.dart';
import '../../../data/repository/autentication/firebase_auth_repository.dart';
import '../../../utils/constants/space.dart';
import '../controller/application_controler.dart';
import '../widget/application_status_card.dart';

class ApplicationScreen extends StatelessWidget {
  const ApplicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ApplicationControler());
    final userId = AutenticationRepository.instance.firebaseUser.value?.uid;
    final userRepo = Get.put(UserRepository());

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
              child: Obx(() {
                // Get the number of filtered applications
                final filteredApplications = controller.filteredApplications;
                return Text(
                  'You have ${filteredApplications.length} Applications',
                  style: JTStyle.appBarT
                      .copyWith(fontSize: 22, color: JColors.blackBlue),
                );
              }),
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
                itemCount: 3, // Only 3 statuses: Delivered, Reviewing, Canceled
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
                          child: Text(controller.btnTitle[
                              index + 1]), // Start from index 1 to avoid "All"
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: JSpace.space16),

            // StreamBuilder to fetch the applied jobs based on the selected status
            StreamBuilder(
              stream: userRepo.fetchAppliedJobs(userId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text('No applications found.'),
                  );
                }

                // Get all applications from snapshot
                final applications = snapshot.data!.docs;

                // Call the filter method after the StreamBuilder is done
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  controller.filterApplications(applications);
                });

                // Now use Obx outside the StreamBuilder
                return Obx(() {
                  final filteredApplications = controller.filteredApplications;
                  if (filteredApplications.isEmpty) {
                    return const Center(
                      child: Text(
                          'No applications found for the selected status.'),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredApplications.length,
                    itemBuilder: (context, index) {
                      final doc = filteredApplications[index];
                      final jobId = doc['id'];
                      Get.snackbar(doc['id'], doc['id']);
                      return FutureBuilder(
                        future: userRepo.fetchJobById(jobId),
                        builder: (context, jobSnapshot) {
                          if (jobSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          if (!jobSnapshot.hasData) {
                            return const Center(child: Text('Job not found.'));
                          }

                          final job = jobSnapshot.data!;
                          return ApplicationStatusCard(
                            jobId: job.id,
                            status: doc['status'],
                          );
                        },
                      );
                    },
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
