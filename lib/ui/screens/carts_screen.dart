import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:ostad_ecommerce/ui/getx/auth_controller.dart';
import 'package:ostad_ecommerce/ui/getx/bottom_navigation_controller.dart';
import 'package:ostad_ecommerce/ui/screens/emailAuthScreen.dart';
import 'package:ostad_ecommerce/ui/utils/app_colors.dart';
import 'package:ostad_ecommerce/ui/widgets/AppElevatedButton.dart';
import 'package:ostad_ecommerce/ui/widgets/IncDecFormField.dart';
import 'package:ostad_ecommerce/ui/widgets/cartProductItem.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  AuthController authController = Get.put(AuthController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (!authController.authState) {
      controller.selectedIndex = 0;
      Get.to(EmailAuthScreen(),
      );
    }
    });
  
  }

  BottomNavigationController controller = Get.put(BottomNavigationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          'Carts',
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return cartProductItem();
                }),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.20),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'Total Price',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '\$10000',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                SizedBox(
                    width: 120,
                    child: AppElevatedButton(onTap: () {}, text: 'Checkout')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
