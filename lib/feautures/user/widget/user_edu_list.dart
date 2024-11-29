import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/model/user/education.dart';
import '../../../utils/constants/color.dart';

Widget userEducation(String? header, RxList<Education> education) {
  return Obx(
    () => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header!.isEmpty
            ? const SizedBox.shrink()
            : Text(
                header,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: JColors.blackBlue,
                ),
              ),
        const SizedBox(height: 8),
        education.isEmpty
            ? const Center(
                child: Text(
                  'No Data',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: JColors.blackBlue,
                  ),
                ),
              )
            : Column(
                children: education.map((exp) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: JColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exp.title,
                          style: const TextStyle(
                            color: JColors.blackBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          exp.inistitutionName,
                          style: const TextStyle(color: JColors.greyMuted),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${exp.startDate} - ${exp.endDate}',
                          style: const TextStyle(color: JColors.greyMuted),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  );
                }).toList(),
              ),
      ],
    ),
  );
}
