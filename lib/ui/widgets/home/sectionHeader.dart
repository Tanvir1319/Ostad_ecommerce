import 'package:flutter/material.dart';
import 'package:ostad_ecommerce/ui/utils/app_colors.dart';

class SectionHeader extends StatelessWidget {
  final String headerName;
  final VoidCallback onTapSeeAll;
  const SectionHeader({super.key,
  required this.headerName,
  required this.onTapSeeAll
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headerName,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: .6,
          ),
        ),
        TextButton(
            onPressed: onTapSeeAll,
            child: Text(
              "See All",
              style: TextStyle(
                color: AppColors.primaryColor,
              ),
            )),
      ],
    );
  }
}
