import 'package:flutter/material.dart';

import '../../../common/style/text_style.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/space.dart';

class PopularCard extends StatelessWidget {
  final String imagePath;
  final String jobTitile;
  final String componyName;
  final String salary;
  final String location;

  const PopularCard({
    super.key,
    required this.imagePath,
    required this.jobTitile,
    required this.componyName,
    required this.salary,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: JColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 43,
            width: 43,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: JSpace.space16),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Use Flexible to allow text truncation when needed
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        jobTitile,
                        style: JTStyle.subTitle,
                        overflow:
                            TextOverflow.ellipsis, // Truncate with ellipsis
                        maxLines: 1, // Allow only 1 line
                      ),
                      Text(
                        componyName,
                        style: JTStyle.subTitle.copyWith(
                          color: JColors.greyMuted,
                        ),
                        overflow:
                            TextOverflow.ellipsis, // Truncate with ellipsis
                        maxLines: 1, // Allow only 1 line
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        salary,
                        style: JTStyle.subTitle,
                        overflow:
                            TextOverflow.ellipsis, // Truncate with ellipsis
                        maxLines: 1, // Allow only 1 line
                      ),
                      Text(
                        location,
                        style: JTStyle.subTitle.copyWith(
                          color: JColors.greyMuted,
                        ),
                        overflow:
                            TextOverflow.ellipsis, // Truncate with ellipsis
                        maxLines: 1, // Allow only 1 line
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
