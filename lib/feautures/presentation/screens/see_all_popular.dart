import 'package:flutter/material.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/space.dart';
import '../widget/popular_card.dart';

class PopularJobAll extends StatelessWidget {
  const PopularJobAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Job'),
        centerTitle: true,
      ),
      backgroundColor: JColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView(
            children: const [
              SizedBox(height: JSpace.space16),
              // PopularCard(),
              SizedBox(height: JSpace.space16),
              // PopularCard(),
              SizedBox(height: JSpace.space16),
              // PopularCard(),
              SizedBox(height: JSpace.space16),
              // PopularCard(),
              SizedBox(height: JSpace.space16),
              // PopularCard(),
              SizedBox(height: JSpace.space16),
              // PopularCard(),
              SizedBox(height: JSpace.space16),
              // PopularCard(),
              SizedBox(height: JSpace.space16),
              // PopularCard(),
              SizedBox(height: JSpace.space16),
              // PopularCard(),
            ],
          ),
        ),
      ),
    );
  }
}
