import 'package:flutter/material.dart';

import '../../../../../utils/constants/space.dart';

Widget descriptionWidget() {
  return Container(
    margin: const EdgeInsets.only(top: 8, left: 12),
    child: ListView(
      children: const [
        SizedBox(height: JSpace.space16),
        Text(
            'We are teams who create all of facebook\'s products used by billions of people around the world. Want to build new feauture and improve existing products like Messenger, Video, Groups,News Feed,Search and more?'),
        SizedBox(height: JSpace.space16),
        Text('Responsibility'),
        SizedBox(height: JSpace.space16),
        ListTile(
          leading: Icon(Icons.check),
          title: Text(
              'Full Stack web/mobile application development with a variety of coding languages'),
        ),
        SizedBox(height: JSpace.space16),
        ListTile(
          leading: Icon(Icons.check),
          title: Text(
              'Full Stack web/mobile application development with a variety of coding languages'),
        ),
        SizedBox(height: JSpace.space16),
        ListTile(
          leading: Icon(Icons.check),
          title: Text(
              'Full Stack web/mobile application development with a variety of coding languages'),
        ),
        SizedBox(height: JSpace.space16),
        ListTile(
          leading: Icon(Icons.check),
          title: Text(
              'Full Stack web/mobile application development with a variety of coding languages'),
        ),
      ],
    ),
  );
}
