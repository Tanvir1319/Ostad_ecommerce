import 'package:flutter/material.dart';
import 'package:ostad_ecommerce/ui/utils/app_colors.dart';
import 'package:ostad_ecommerce/ui/widgets/IncDecFormField.dart';

class cartProductItem extends StatelessWidget {
  const cartProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return   Card(
            margin: EdgeInsets.symmetric(horizontal: 16,vertical: 6),
            elevation: 2,
            child: Row(
              children: [
                Image.asset(
                  'assets/images/shoe1.png',
                  height: 70,
                  width: 90,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Product Name',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    letterSpacing: 0.4),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Product Color, ',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(
                                    'Product Size',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete_outline,
                                color: Colors.red,
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$100",
                            style: TextStyle(
                                fontSize: 15,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 80,
                            width: 90,
                            child: IncDecFormField(
                              onchange:  (newValue){
                                      
                                    },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}