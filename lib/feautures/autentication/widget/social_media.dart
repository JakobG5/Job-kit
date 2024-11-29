import 'package:flutter/material.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/image.dart';
import '../../../utils/helper/device_util.dart';

class SocialMediaRegister extends StatelessWidget {
  final Function()? appleRegister;
  final Function()? googleRegister;
  final Function()? facebookRegister;

  const SocialMediaRegister({
    super.key,
    this.appleRegister,
    this.googleRegister,
    this.facebookRegister,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (JHelper.isIOS()) // Show only on iOS
            GestureDetector(
              onTap: appleRegister,
              child: Container(
                height: 56,
                width: 56,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: JColors.white,
                ),
                child: const Center(
                  child: Image(
                    image: AssetImage(JImage.apple),
                    height: 26,
                    width: 26,
                  ),
                ),
              ),
            ),
          const SizedBox(width: 24),
          GestureDetector(
            onTap: googleRegister,
            child: Container(
              height: 56,
              width: 56,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: JColors.white,
              ),
              child: const Center(
                child: Image(
                  image: AssetImage(JImage.google),
                  height: 26,
                  width: 26,
                ),
              ),
            ),
          ),
          const SizedBox(width: 24),
          GestureDetector(
            onTap: facebookRegister,
            child: Container(
              height: 56,
              width: 56,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: JColors.white,
              ),
              child: const Center(
                child: Image(
                  image: AssetImage(JImage.facebook),
                  height: 26,
                  width: 26,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
