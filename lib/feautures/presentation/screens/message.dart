import 'package:flutter/material.dart';
import 'package:job_kit/utils/constants/color.dart';

import '../../../utils/constants/space.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: JColors.background,
        appBar: AppBar(
          elevation: 3,
          title: const Text('Message'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Person',
              ),
              Tab(
                text: 'Componies',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: const [
                SizedBox(height: JSpace.space32),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text('You have no message from users'),
                )
              ],
            ),
            ListView(
              children: const [
                SizedBox(height: JSpace.space32),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text('You have no message from componies'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
