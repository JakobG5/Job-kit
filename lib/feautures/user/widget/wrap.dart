import 'package:flutter/material.dart';
import '../../../common/model/user/string.dart';
import '../../../utils/constants/color.dart';

Widget wrap(List<StringList> list) {
  return Wrap(
    children: list.map((e) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 6,
          vertical: 2,
        ),
        decoration: const BoxDecoration(
          color: JColors.greyMuted,
        ),
        child: Center(
          child: Text(
            e.content,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      );
    }).toList(),
  );
}
