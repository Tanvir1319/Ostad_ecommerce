import 'package:flutter/material.dart';
import 'package:ostad_ecommerce/data/models/product_model.dart';
import 'package:ostad_ecommerce/ui/screens/product_details_screen.dart';
import 'package:ostad_ecommerce/ui/utils/app_colors.dart';

//check done

class ProductItemPreviewCard extends StatelessWidget {
  final ProductData productData;
  const ProductItemPreviewCard({super.key,
  required this.productData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductDetailsScreen(
                productId: productData.id ?? 0,

            )));
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Image.network(
              productData.image ?? '',
              height: 90,
              width: 160,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 28,
            ),
            Text(
              productData.title  ?? '',
              maxLines: 2,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${productData.price?? ""}',
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 9,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amberAccent,
                  size: 14,
                ),
                SizedBox(
                  width: 6,
                ),
                Text('${productData.star ?? 0.0}'),
                SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(4)),
                    child: Icon(
                      Icons.favorite_border,
                      size: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
