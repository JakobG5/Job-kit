import 'package:flutter/material.dart';
import '../../../common/style/text_style.dart';
import '../../../utils/constants/color.dart';

class ApplicationStatus extends StatelessWidget {
  const ApplicationStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: JColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 44,
                width: 44,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asset/google.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'data',
                          style: JTStyle.subTitle,
                        ),
                        Text(
                          'data',
                          style: JTStyle.btnTitle.copyWith(
                            color: JColors.greyMuted,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'data',
                          style: JTStyle.subTitle,
                        ),
                        Text(
                          'data',
                          style: JTStyle.btnTitle.copyWith(
                            color: JColors.greyMuted,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(52),
                  color: const Color(0xFFDC312D),
                ),
                child: const Center(
                  child: Text('Cancled'),
                ),
              ),
              const Text(
                'data',
                style: JTStyle.subTitle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
