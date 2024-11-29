import 'package:flutter/material.dart';
import 'package:job_kit/common/model/user/work_expriance.dart';
import '../../../utils/constants/color.dart';
import 'package:get/get.dart';

Widget userExpriance(String? header, RxList<WorkExpriance> expriance) {
  return Obx(() => Column(
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
          expriance.isEmpty
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
                  children: expriance.map((exp) {
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
                            exp.positionTitle,
                            style: const TextStyle(
                              color: JColors.blackBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            exp.componyName,
                            style: const TextStyle(color: JColors.greyMuted),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${exp.startDate} - ${exp.endDate}',
                            style: const TextStyle(color: JColors.greyMuted),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
        ],
      ));
}
