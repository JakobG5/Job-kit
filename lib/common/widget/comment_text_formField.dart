import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants/color.dart';

class CustomMultiLineTF extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final RxBool isObscure;
  final String label;
  final FocusNode _focusNode = FocusNode();

  CustomMultiLineTF({
    super.key,
    required this.controller,
    required this.isObscure,
    this.validator,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
          focusNode: _focusNode,
          onTapOutside: (_) {
            FocusScope.of(context).unfocus();
          },
          minLines: 4,
          maxLines: 6,
          controller: controller,
          keyboardType: TextInputType.multiline,
          validator: validator,
          obscureText: isObscure.value,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 1,
                  color: JColors.borderColor,
                )),
            filled: true,
            fillColor: JColors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 1,
                  color: JColors.blackBlue,
                )),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.redAccent,
                )),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.redAccent,
                )),
            hintText: label,
            hintStyle: const TextStyle(
              color: JColors.borderColor,
              fontSize: 14,
            ),
          ),
        ));
  }
}
