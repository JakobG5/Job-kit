import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/data/repository/autentication/firebase_auth_repository.dart';
import '../../../data/repository/user/user_repository.dart';
import '../../presentation/widget/popular_card.dart';
import '../widget/data1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Job extends StatelessWidget {
  const Job({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserRepository());
    final userId =
        AutenticationRepository.instance.firebaseUser.value?.uid ?? '';

    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        title: const Text('Jobs Posted'),
        actions: [
          IconButton(
            onPressed: () => Get.to(() => const JobDataOne()),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
        future: controller.fetchPostedJobs(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No jobs found.'));
          }

          final jobs = snapshot.data!.docs;

          return RefreshIndicator(
            onRefresh: () async {
              await controller.fetchPostedJobs(userId);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: ListView.builder(
                itemCount: jobs.length,
                itemBuilder: (context, index) {
                  final jobData = jobs[index].data(); // Map of job data

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: PopularCard(
                      componyName: jobData['componyNamee'],
                      imagePath: jobData['imagePath'],
                      jobTitile: jobData['positionTitile'],
                      location:
                          '${jobData['location']?['cityName'] ?? 'Unknown City'}, ${jobData['location']?['countryName'] ?? 'Unknown Country'}',
                      salary: jobData['salary'],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
