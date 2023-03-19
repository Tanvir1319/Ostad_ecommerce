import 'package:flutter/material.dart';
import 'package:ostad_ecommerce/ui/utils/app_colors.dart';

class AppTextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final int? maxLines;
  const AppTextFieldWidget({
    super.key,
    this.controller,
    this.maxLines,
    required this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines?? 1,
      decoration: InputDecoration(
        
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: AppColors.primaryColor,
        )),
      ),
    );
  }
}
