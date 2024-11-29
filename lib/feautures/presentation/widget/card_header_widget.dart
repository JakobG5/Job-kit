import 'package:flutter/material.dart';

import '../../../common/style/text_style.dart';
import '../../../utils/constants/color.dart';

class CardHeader extends StatelessWidget {
  final String headerTitile;
  final Function()? function;

  const CardHeader({
    super.key,
    required this.headerTitile,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(headerTitile,
            style: JTStyle.btnTitle.copyWith(color: JColors.darkBlue)),
        const Spacer(),
        TextButton(
          onPressed: function,
          child: Text('see all',
              style: JTStyle.btnTitle.copyWith(color: JColors.borderColor)),
        ),
      ],
    );
  }
}
