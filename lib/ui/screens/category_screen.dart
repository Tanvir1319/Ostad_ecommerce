import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommerce/ui/getx/bottom_navigation_controller.dart';
import 'package:ostad_ecommerce/ui/getx/category_controller.dart';
import 'package:ostad_ecommerce/ui/screens/product_list_screen.dart';
import 'package:ostad_ecommerce/ui/widgets/CategoryItemWidget.dart';

class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen({super.key});

  @override
  State<ProductCategoryScreen> createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {
  BottomNavigationController controller = Get.put(BottomNavigationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          'Categories',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            controller.changeIndex(0);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
      ),
      body: GetBuilder<CategoryController>(builder: (controller) {
        if (controller.getCategoryInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return RefreshIndicator(
          onRefresh: () async {
            controller.getCategories();
          },
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: controller.categoryModel.data?.length ?? 0,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: CategoryItemWidget(
                    CategoryItemName:
                        controller.categoryModel.data![index].categoryName ??
                            '',
                    image:
                        controller.categoryModel.data![index].categoryImg ?? '',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListScreen(categoryId:'${controller.categoryModel.data![index].id ?? 1}' ,
                      categoryName:controller.categoryModel.data![index].categoryName??"" ,
                      ),
                      
                      ),
                      );
                    },
                  ),
                );
              }),
        );
      }),
    );
  }
}
