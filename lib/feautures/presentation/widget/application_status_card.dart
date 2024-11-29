import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/color.dart';
import '../../../common/style/text_style.dart';

class ApplicationStatusCard extends StatelessWidget {
  final String jobId; // Only accepting jobId
  final String status;

  const ApplicationStatusCard({
    super.key,
    required this.jobId,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    String statusText;

    // Define status colors and texts based on the status value
    switch (status) {
      case 'Delivered':
        statusColor = Colors.green;
        statusText = 'Delivered';
        break;
      case 'Reviewing':
        statusColor = Colors.orange;
        statusText = 'Reviewing';
        break;
      case 'Canceled':
        statusColor = Colors.red;
        statusText = 'Canceled';
        break;
      default:
        statusColor = Colors.grey;
        statusText = 'Pending';
    }

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('jobs')
          .where('id', isEqualTo: jobId) // Fetch job by id field in Firestore
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('Job not found.'));
        }

        final job = snapshot.data!.docs[0]; // Get the first document

        return Container(
          height: 140,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: JColors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Job Image
                  Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            job['imagePath']), // Assuming image is a URL
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),
                  // Job Details
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(job['positionTitile'],
                                style: JTStyle.subTitle),
                            Text(
                                '${job['location']?['cityName'] ?? 'Unknown City'}, ${job['location']?['countryName'] ?? 'Unknown Country'}',
                                style: JTStyle.btnTitle
                                    .copyWith(color: JColors.greyMuted)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(job['salary'], style: JTStyle.subTitle),
                            Text(job['componyNamee'],
                                style: JTStyle.btnTitle
                                    .copyWith(color: JColors.greyMuted)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Status Container
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(52),
                      color: statusColor,
                    ),
                    child: Center(
                      child: Text(statusText),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
