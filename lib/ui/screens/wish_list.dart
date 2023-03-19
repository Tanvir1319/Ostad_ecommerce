import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommerce/ui/widgets/home/ProductItemPreviewCard.dart';

import '../getx/bottom_navigation_controller.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  BottomNavigationController controller = Get.put(BottomNavigationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          'Wishlist',
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
      //body: GridView.builder(
         // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //crossAxisCount: 3,
           // childAspectRatio: 1.6/3,
         // ),
         // itemCount: 100,
          //itemBuilder: (context, index) {
           // return ProductItemPreviewCard(
           //  
           // );
       //   }),
    );
  }
}
