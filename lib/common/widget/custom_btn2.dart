import 'package:flutter/material.dart';
import 'package:job_kit/utils/constants/color.dart';
import 'package:job_kit/utils/helper/device_util.dart';

import '../style/text_style.dart';

class CustomBtnTwo extends StatelessWidget {
  final Function()? function1;
  final Function()? function2;

  const CustomBtnTwo({
    super.key,
    required this.function2,
    required this.function1,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: JHelper.getWidth(context)! * .9,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: function1,
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: JColors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    'Skip',
                    style: JTStyle.btnTitle.copyWith(color: JColors.deepBlue),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: function2,
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                  color: JColors.deepBlue,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    'Next',
                    style: JTStyle.btnTitle.copyWith(color: JColors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
