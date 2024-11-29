import 'package:flutter/material.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/space.dart';
import '../../../utils/helper/device_util.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: JHelper.getHeight(context)! * 0.3,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 26),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: const DecorationImage(
          image: AssetImage('asset/Background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: JSpace.space16),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('asset/jakob.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Yakob Girma',
                    style: TextStyle(fontSize: 16, color: JColors.white),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Addis Abeba,Ethiopia',
                    style: TextStyle(fontSize: 16, color: JColors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      children: [
                        Expanded(
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.share,
                                color: JColors.white,
                              )),
                        ),
                        const SizedBox(width: JSpace.space8),
                        Expanded(
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.settings,
                                color: JColors.white,
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}