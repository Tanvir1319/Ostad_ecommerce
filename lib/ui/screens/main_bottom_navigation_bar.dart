import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ostad_ecommerce/ui/getx/category_controller.dart';
import 'package:ostad_ecommerce/ui/getx/home_controller.dart';
import 'package:ostad_ecommerce/ui/getx/product_controller.dart';
import 'package:ostad_ecommerce/ui/screens/carts_screen.dart';
import 'package:ostad_ecommerce/ui/screens/category_screen.dart';
import 'package:ostad_ecommerce/ui/screens/home_screen.dart';
import 'package:ostad_ecommerce/ui/screens/wish_list.dart';
import 'package:ostad_ecommerce/ui/utils/app_colors.dart';

import '../getx/bottom_navigation_controller.dart';

class MainBottomNavigationBar extends StatefulWidget {
  MainBottomNavigationBar({super.key});

  @override
  State<MainBottomNavigationBar> createState() =>
      _MainBottomNavigationBarState();
}

class _MainBottomNavigationBarState extends State<MainBottomNavigationBar> {
  HomeController homeController = Get.put(HomeController());
  CategoryController categoryController = Get.put(CategoryController());
  BottomNavigationController controller = Get.put(BottomNavigationController());
  ProductController productController = Get.put(ProductController());
  final List<Widget> screens = [
    HomeScreen(),
    ProductCategoryScreen(),
    CartScreen(),
    WishListScreen(),
  ];

  @override
  void initState() {
    super.initState();
    homeController.getProductSliderList();
    categoryController.getCategories();
    productController.getNewProducts();
    productController.getPopularProducts();
    productController.getSpecialProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavigationController>(builder: (_) {
        return screens[controller.selectedIndex];
      }),
      bottomNavigationBar: GetBuilder<BottomNavigationController>(builder: (_) {
        return BottomNavigationBar(
          currentIndex: controller.selectedIndex,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: (index) {
            controller.selectedIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'Wishlist',
            ),
          ],
        );
      }),
    );
  }
}
