// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.controller,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.hintText,
    this.keyboardType,
    this.maxLength,
    this.errorText,
  }) : super(key: key);

  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Widget? prefix;
  final Widget? suffix;
  final String? hintText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxLength,
      keyboardType: keyboardType,
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        errorText: errorText,
        suffixIcon: suffix,
        prefix: prefix,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
