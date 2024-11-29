import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants/color.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final String? Function(String?)? validator;
  final RxBool isObscure;
  final String label;
  final IconData? prefixIcon;
  final IconData? suffixTrue;
  final IconData? suffixFalse;
  final VoidCallback? toogleVisibility;
  final TextCapitalization autoCapitalize;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.inputType,
    required this.isObscure,
    this.validator,
    required this.label,
    this.prefixIcon,
    this.suffixFalse,
    this.suffixTrue,
    this.toogleVisibility,
    this.autoCapitalize = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        textCapitalization: autoCapitalize,
        controller: controller,
        keyboardType: inputType,
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
              const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
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
          prefixIcon: Icon(
            prefixIcon,
            color: JColors.greyMuted,
          ),
          suffixIcon: isObscure.value
              ? GestureDetector(
                  onTap: toogleVisibility,
                  child: Icon(suffixTrue, color: JColors.blackBlue))
              : GestureDetector(
                  onTap: toogleVisibility,
                  child: Icon(
                    suffixFalse,
                    color: JColors.borderColor,
                  ),
                ),
        ),
      ),
    );
  }
}
