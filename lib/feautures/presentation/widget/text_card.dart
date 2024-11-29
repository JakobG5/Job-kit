import 'package:flutter/material.dart';

import '../../../utils/constants/color.dart';

class TextCard extends StatelessWidget {
  final String title;
  const TextCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(65),
        color: JColors.white.withOpacity(0.5),
      ),
      child: Center(
        child: Text(
          title,
          softWrap: true,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis, // Truncate with ellipsis
          maxLines: 1,
        ),
      ),
    );
  }
}
