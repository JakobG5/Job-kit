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
          Container(
            height: 40,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              isScrollable: true,
              controller: _tabController,
              labelColor: JColors.blackBlue,
              indicatorWeight: 0.1,
              labelStyle: const TextStyle(fontSize: 14),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: const [
                Tab(text: 'Description'),
                Tab(text: 'Requirement'),
                Tab(text: 'About'),
                Tab(text: 'Reviews'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                descriptionWidget('Job Description'),
                descriptionWidget('Requirements'),
                descriptionWidget('About the Company'),
                descriptionWidget('Reviews'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: CustomBtnOne(
              function: () {
                Get.to(const ApplyJob());
              },
              btnTite: 'Appply',
            ),
          ),
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
