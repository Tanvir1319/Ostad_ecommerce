import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommerce/data/models/product_model.dart';
import 'package:ostad_ecommerce/ui/getx/product_controller.dart';
import 'package:ostad_ecommerce/ui/widgets/home/ProductItemPreviewCard.dart';

import '../getx/bottom_navigation_controller.dart';

class ProductListScreen extends StatefulWidget {
  final String categoryId, categoryName;
  const ProductListScreen({
    super.key,
    required this.categoryId, required this.categoryName,

  });

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  ProductController controller = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getProductsByCategory(widget.categoryId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          widget.categoryName,
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
      ),
      body: GetBuilder<ProductController>(builder: (ProductController) {
        if (ProductController.productCategoryInProgress) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
         if((ProductController.productByCategoryModel.data?.length ?? 0) == 0){
            return const Center(
              child: Text("No products"),
            );
          }
        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  3,
              childAspectRatio: 1.6 / 3,
            ),
            itemCount:ProductController.productByCategoryModel.data?.length ?? 0,
            itemBuilder: (context, index) {
              return ProductItemPreviewCard(productData: ProductController.productByCategoryModel.data![index]);
            });
      }),
    );
  }
}
