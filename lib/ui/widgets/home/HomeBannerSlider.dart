import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ostad_ecommerce/data/models/product_slider_model.dart';
import 'package:ostad_ecommerce/ui/utils/app_colors.dart';

class HomeBannerSlider extends StatelessWidget {
  final CarouselController _carouselController = CarouselController();
  final ValueNotifier<int> _currentSelectedIndex = ValueNotifier(0);
  final ProductSliderModel productSliderModel;

  HomeBannerSlider({
    super.key,
    required this.productSliderModel, 
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
              autoPlay: true,
              reverse: false,
              height: 180.0,
              viewportFraction: 1.0,
              onPageChanged: (index, _) {
                _currentSelectedIndex.value = index;
              }),
          items: productSliderModel.data?.map((slider) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 1.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 193, 7, 1),
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(image: NetworkImage(slider.image ?? ''))
                  ),
                  alignment: Alignment.center,
                );
              },
            );
          }).toList(),
        ),
        SizedBox(
          height: 4,
        ),
        ValueListenableBuilder(
            valueListenable: _currentSelectedIndex,
            builder: (context, updateValue, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < (productSliderModel.data?.length ?? 0); i++)
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
                                : Colors.grey),
                                
                      ),
                    ),
                ],
              );
            })
      ],
    );
  }
}
