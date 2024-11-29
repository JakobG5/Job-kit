import 'package:flutter/material.dart';
import 'package:job_kit/common/style/text_style.dart';
import 'package:job_kit/utils/constants/color.dart';
import 'package:job_kit/utils/helper/device_util.dart';

class CustomBtnOne extends StatelessWidget {
  final Function()? function;
  final String btnTite;

  const CustomBtnOne({
    super.key,
    required this.function,
    required this.btnTite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 56,
        width: JHelper.getWidth(context)! * .9,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(6),
          color: JColors.deepBlue,
        ),
        child: Center(
          child: Text(
            btnTite,
            style: JTStyle.btnTitle.copyWith(
              color: JColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
