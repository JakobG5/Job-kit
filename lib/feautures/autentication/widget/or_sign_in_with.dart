import 'package:flutter/material.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/space.dart';
import '../../../common/style/text_style.dart';

class SignWith extends StatelessWidget {
  const SignWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(child: Divider()),
        const SizedBox(width: JSpace.space8),
        Text(
          'or sign in with',
          style: JTStyle.subTitle.copyWith(color: JColors.borderColor),
        ),
        const SizedBox(width: JSpace.space8),
        const Flexible(child: Divider()),
      ],
    );
  }
}
