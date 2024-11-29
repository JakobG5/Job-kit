import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widget/custom_btn1.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/space.dart';
import 'apply_job_screen.dart';
import 'widget/job_header_card.dart';

class JobScreen extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;
  const JobScreen({
    super.key,
    required this.documentSnapshot,
  });

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final documentSnapshot = widget.documentSnapshot;

    final jobRequirements =
        documentSnapshot['jobRequirements'] as Map<String, dynamic>;
    final header = jobRequirements['header'] as String;
    final points = jobRequirements['points'] as List<dynamic>;

    final firstPoint = points.isNotEmpty ? points[0]['content'] : 'No Content';
    final secondPoint = points.length > 1 ? points[1]['content'] : 'No Content';
    final thirdPoint = points.length > 2 ? points[2]['content'] : 'No Content';

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: JColors.white),
        backgroundColor: const Color.fromARGB(255, 176, 201, 216),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border),
          ),
        ],
      ),
      body: Column(
        children: [
          JobHeaderCard(
            componyName: documentSnapshot['componyNamee'],
            duration: documentSnapshot['duration'],
            imagePath: documentSnapshot['imagePath'],
            jobTitle: documentSnapshot['positionTitile'],
            level: documentSnapshot['employeeType'],
            location:
                '${documentSnapshot['location']['cityName']}, ${documentSnapshot['location']['countryName']}',
            position: documentSnapshot['field'],
            salary: documentSnapshot['salary'],
          ),
          const SizedBox(height: JSpace.space16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              height: 40,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                isScrollable: false,
                controller: _tabController,
                labelColor: JColors.blackBlue,
                indicatorWeight: 0.1,
                labelStyle: const TextStyle(fontSize: 14),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: const [
                  Tab(
                    child: Wrap(
                      children: [
                        Text(
                          'Description',
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  Tab(
                    child: Wrap(
                      children: [
                        Text(
                          'Requirements',
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  Tab(
                    child: Wrap(
                      children: [
                        Text(
                          'About',
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                  Tab(
                    child: Wrap(
                      children: [
                        Text(
                          'Other',
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                descriptionWidget('$header\n\n$firstPoint'),
                descriptionWidget(secondPoint),
                descriptionWidget(documentSnapshot['about']),
                descriptionWidget(thirdPoint),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: CustomBtnOne(
              function: () {
                final jobId = documentSnapshot['id'];
                if (jobId == null || jobId.isEmpty) {
                  // Handle error case, maybe show a snackbar or alert
                  Get.snackbar('Error', 'Job ID is missing or invalid');
                  return;
                }

                Get.to(ApplyJob(
                  id: jobId,
                  componyName:
                      documentSnapshot['componyNamee'] ?? 'Unknown Company',
                  jobTitle:
                      documentSnapshot['positionTitile'] ?? 'Unknown Position',
                  imgPath: documentSnapshot['imagePath'] ?? '',
                  location:
                      '${documentSnapshot['location']['cityName'] ?? 'Unknown City'}, ${documentSnapshot['location']['countryName'] ?? 'Unknown Country'}',
                  salary: documentSnapshot['salary'] ?? 'Not Specified',
                ));
              },
              btnTite: 'Apply',
            ),
          )
        ],
      ),
    );
  }

  Widget descriptionWidget(String content) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        content,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
