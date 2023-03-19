import 'package:flutter/material.dart';
import 'package:ostad_ecommerce/ui/utils/app_colors.dart';

class AppElevatedButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  const AppElevatedButton({super.key,
  required this.onTap,
  required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          padding: EdgeInsets.all(26),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onTap,
        child: Text(text),
      ),
    );
  }
}
