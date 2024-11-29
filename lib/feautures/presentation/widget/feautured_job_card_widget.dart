// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/style/text_style.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/space.dart';
import '../screens/job_screen/job_screen.dart';
import 'text_card.dart';

class FeauturedCard extends StatelessWidget {
  final String image;
  final String componyName;
  final String jobPosition;
  final String jobCategory;
  final String jobDuration;
  final String exprianceLevel;
  final String salary;
  final String location;
  final double? width;
  final DocumentSnapshot documentSnapshot;

  const FeauturedCard({
    super.key,
    required this.image,
    required this.componyName,
    required this.jobPosition,
    required this.jobCategory,
    required this.jobDuration,
    required this.exprianceLevel,
    required this.salary,
    required this.location,
    this.width = 280,
    required this.documentSnapshot,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(JobScreen(
          documentSnapshot: documentSnapshot,
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 18),
        padding: const EdgeInsets.all(24),
        height: 186,
        width: width,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 176, 201, 216),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 46,
                  width: 46,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      shape: BoxShape.rectangle,
                      color: JColors.white,
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      )),
                ),
                const SizedBox(width: JSpace.space16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      jobPosition,
                      style: JTStyle.btnTitle
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      componyName,
                      style: JTStyle.subTitle.copyWith(color: JColors.white),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextCard(
                    title: jobCategory,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextCard(
                    title: jobDuration,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextCard(
                    title: exprianceLevel,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$salary ETB',
                  style: JTStyle.subTitle.copyWith(
                    color: JColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  location,
                  style: JTStyle.subTitle.copyWith(
                    color: JColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
