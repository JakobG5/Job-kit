import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/color.dart';
import '../controller/book_mark_controller.dart';
import '../widget/popular_card.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookMarkController());

    return Scaffold(
      backgroundColor: JColors.background,
      body: Obx(() {
        if (controller.bookmarkedJobs.isEmpty) {
          return const Center(
            child: Text('No bookmarked Jobs'),
          );
        }

        return ListView.builder(
          itemCount: controller.bookmarkedJobs.length,
          itemBuilder: (context, index) {
            final job = controller.bookmarkedJobs[index];

            // Debugging: Check the runtime type of the item
            print('Item at index $index: ${job.runtimeType}');

            // Ensure 'job' is a Map and access safely
            if (job is! Map<String, dynamic>) {
              return const Center(child: Text('Invalid job format'));
            }

            final imagePath = job['imagePath'] ?? '';
            final jobTitile = job['positionTitile'];
            final componyName = job['componyNamee'] ?? 'Unknown Company';
            final salary = job['salary'] ?? 'Not Specified';

            // Safely access the nested location map
            final location = job['location'];
            String locationCity = 'Unknown City';
            String locationCountry = 'Unknown Country';

            if (location is Map<String, dynamic>) {
              locationCity = location['cityName'] ?? 'Unknown City';
              locationCountry = location['countryName'] ?? 'Unknown Country';
            }

            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
              child: PopularCard(
                imagePath: imagePath,
                jobTitile: jobTitile,
                componyName: componyName,
                salary: salary,
                location: '$locationCity, $locationCountry',
              ),
            );
          },
        );
      }),
    );
  }
}
