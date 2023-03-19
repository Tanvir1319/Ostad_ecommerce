import 'package:flutter/material.dart';
import 'package:ostad_ecommerce/ui/utils/app_colors.dart';
//done check
class CategoryItemWidget extends StatelessWidget {
  final String CategoryItemName;
  final String image;
  VoidCallback onTap;

   CategoryItemWidget({
    super.key,
    required this.CategoryItemName,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.network(image, height: 60, width: 60,)
                ),
               
                Text(
                  CategoryItemName,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColor,
                      letterSpacing: 0.6),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
