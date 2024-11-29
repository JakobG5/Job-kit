import 'package:flutter/material.dart';
import '../../../utils/constants/color.dart';

Widget userDescription(String header, String data) {
  return SizedBox(
    height: 66,
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: JColors.blackBlue,
          ),
        ),
        Container(
          height: 40,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: JColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(data),
        ),
      ],
    ),
  );
}
