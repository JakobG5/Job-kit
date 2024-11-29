import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_kit/utils/constants/color.dart';

import '../../../utils/constants/space.dart';

class SearchModal extends StatelessWidget {
  SearchModal({super.key});
  final search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const SizedBox(height: JSpace.space16),
          Row(
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.close),
              ),
              Expanded(
                child: TextFormField(
                  controller: search,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: JColors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: JColors.borderColor,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: JColors.black,
                        width: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
