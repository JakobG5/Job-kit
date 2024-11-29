import 'package:flutter/material.dart';
import 'package:job_kit/utils/constants/color.dart';
import '../../../utils/constants/space.dart';

class BookMarkScreen extends StatelessWidget {
  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: JColors.background,
      body: ListView(
        children: const [
          SizedBox(height: JSpace.space32),
          Center(
            child: Text('No bookmarked Jobs'),
          )
        ],
      ),
    );
  }
}
