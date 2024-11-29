// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldModel {
  final TextEditingController controller;
  final TextInputType inputType;
  final String? Function(String?)? validator;
  final RxBool isObscure;
  final String label;
  final IconData? prefixIcon;
  final IconData? suffixTrue;
  final IconData? suffixFalse;
  final VoidCallback? toogleVisibility;

  TextFieldModel({
    required this.controller,
    required this.inputType,
    this.validator,
    required this.isObscure,
    required this.label,
    this.prefixIcon,
    this.suffixTrue,
    this.suffixFalse,
    this.toogleVisibility,
  });
}
