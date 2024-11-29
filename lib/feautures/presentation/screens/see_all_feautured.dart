import 'package:flutter/material.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/space.dart';
import '../widget/feautured_job_card_widget.dart';

class FeauturedJobAll extends StatelessWidget {
  const FeauturedJobAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feautured Job'),
        centerTitle: true,
      ),
      backgroundColor: JColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView(
            children: const [
              SizedBox(height: JSpace.space16),
              // FeauturedCard(width: double.infinity),
              // SizedBox(height: JSpace.space16),
              // FeauturedCard(width: double.infinity),
              // SizedBox(height: JSpace.space16),
              // FeauturedCard(width: double.infinity),
              // SizedBox(height: JSpace.space16),
              // FeauturedCard(width: double.infinity),
              // SizedBox(height: JSpace.space16),
              // FeauturedCard(width: double.infinity),
              // SizedBox(height: JSpace.space16),
              // FeauturedCard(width: double.infinity),
              // SizedBox(height: JSpace.space16),
              // FeauturedCard(width: double.infinity),
              // SizedBox(height: JSpace.space16),
              // FeauturedCard(width: double.infinity),
              SizedBox(height: JSpace.space16),
            ],
          ),
        ),
      ),
    );
  }
}
