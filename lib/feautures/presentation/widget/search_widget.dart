import 'package:flutter/material.dart';
import 'package:job_kit/utils/constants/color.dart';

class SearchWidget extends StatelessWidget {
  final dynamic controller;
  const SearchWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onTap: () => controller.searchModal(context),
            readOnly: true,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: JColors.greyMuted,
              ),
              hintText: 'Search..',
              hintStyle: const TextStyle(
                color: JColors.borderColor,
                fontSize: 14,
              ),
              filled: true,
              fillColor: JColors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1,
                    color: JColors.borderColor,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1,
                    color: JColors.blackBlue,
                  )),
            ),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        InkWell(
          onTap: () {
            controller.searchModal(context);
          },
          child: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFFF2F2F3),
            ),
            child: const Center(
              child: Image(
                image: AssetImage('asset/filter.5.png'),
                height: 26,
                width: 26,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
