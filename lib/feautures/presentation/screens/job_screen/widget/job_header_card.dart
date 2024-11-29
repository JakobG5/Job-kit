import 'package:flutter/material.dart';
import '../../../../../common/style/text_style.dart';
import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/space.dart';
import '../../../../../utils/helper/device_util.dart';
import '../../../widget/text_card.dart';

class JobHeaderCard extends StatelessWidget {
  final String? imagePath;
  final String? componyName;
  final String? jobTitle;
  final String? position;
  final String? duration;
  final String? level;
  final double? salary;
  final String? location;
  const JobHeaderCard({
    super.key,
    this.imagePath,
    this.componyName,
    this.jobTitle,
    this.position,
    this.duration,
    this.level,
    this.salary,
    this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: JHelper.getHeight(context)! * 0.32,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 176, 201, 216),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: const BoxDecoration(
              color: JColors.white,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Image(
                image: AssetImage('asset/facebook.png'),
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: JSpace.space16),
          Text(
            'Software Enginner',
            style: JTStyle.title.copyWith(color: JColors.white),
          ),
          const SizedBox(height: JSpace.space16),
          Text(
            'Facebook',
            style: JTStyle.title.copyWith(color: JColors.white, fontSize: 18),
          ),
          const SizedBox(height: JSpace.space16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextCard(
                title: 'It',
              ),
              TextCard(
                title: 'Full Time',
              ),
              TextCard(
                title: 'Junior',
              ),
            ],
          ),
          const SizedBox(height: JSpace.space16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$180,000/year',
                style: JTStyle.subTitle.copyWith(
                  color: JColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'California, USA',
                style: JTStyle.subTitle.copyWith(
                  color: JColors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
