import 'package:flutter/material.dart';
import '../../../../../common/style/text_style.dart';
import '../../../../../utils/constants/color.dart';
import '../../../../../utils/constants/space.dart';
import '../../../../../utils/helper/device_util.dart';
import '../../../widget/text_card.dart';

class JobHeaderCard extends StatelessWidget {
  final String imagePath;
  final String componyName;
  final String jobTitle;
  final String position;
  final String duration;
  final String level;
  final String salary;
  final String location;
  const JobHeaderCard({
    super.key,
    required this.imagePath,
    required this.componyName,
    required this.jobTitle,
    required this.position,
    required this.duration,
    required this.level,
    required this.salary,
    required this.location,
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
            child: Center(
              child: Image(
                image: NetworkImage(imagePath),
                height: 40,
                width: 40,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image),
              ),
            ),
          ),
          const SizedBox(height: JSpace.space16),
          Expanded(
            child: Text(
              jobTitle,
              style: JTStyle.title.copyWith(color: JColors.white),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const SizedBox(height: JSpace.space16),
          Expanded(
            child: Text(
              componyName,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: JTStyle.title.copyWith(color: JColors.white, fontSize: 18),
            ),
          ),
          const SizedBox(height: JSpace.space16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextCard(
                  title: position,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextCard(
                  title: duration,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextCard(
                  title: level,
                ),
              ),
            ],
          ),
          const SizedBox(height: JSpace.space16),
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
    );
  }
}
