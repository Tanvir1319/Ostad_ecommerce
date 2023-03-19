import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ostad_ecommerce/ui/utils/app_colors.dart';

class ProductImageSlider extends StatelessWidget {
  final CarouselController _carouselController = CarouselController();
  final ValueNotifier<int> _currentSelectedIndex = ValueNotifier(0);
  
  ProductImageSlider({super.key,
  required this.sliders,
  });

  final List<String> sliders;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
              height: 230.0,
              viewportFraction: 1.0,
              onPageChanged: (index, _) {
                _currentSelectedIndex.value = index;
              }),
          items: sliders.map((slider) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 1.0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                      slider
                    ),
                    fit: BoxFit.scaleDown,
                  )),
                  alignment: Alignment.center,
                );
              },
            );
          }).toList(),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ValueListenableBuilder(
                    valueListenable: _currentSelectedIndex,
                    builder: (context, updateValue, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < 5; i++)
                            Container(
                              margin: EdgeInsets.all(3),
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                color: i == _currentSelectedIndex.value
                                    ? AppColors.primaryColor
                                    : null,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: i == _currentSelectedIndex.value
                                        ? AppColors.primaryColor
                                        : Colors.white),
                              ),
                            ),
                        ],
                      );
                    }),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
