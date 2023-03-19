import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommerce/data/models/product_details_model.dart';
import 'package:ostad_ecommerce/ui/getx/product_details_controller.dart';
import 'package:ostad_ecommerce/ui/utils/app_colors.dart';
import 'package:ostad_ecommerce/ui/widgets/AppElevatedButton.dart';
import 'package:ostad_ecommerce/ui/widgets/IncDecFormField.dart';
import 'package:ostad_ecommerce/ui/widgets/product_details/product_image_slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;
  const ProductDetailsScreen({
    super.key,
    required this.productId,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDeatilsController _productDetailsController =
      Get.put(ProductDeatilsController());
  Color? selectedColor;
  String? selectedSize;
  double totalAmount = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _productDetailsController.getProductDetailsById(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.black54,
        ),
        title: Text(
          'Product details',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
      body: GetBuilder<ProductDeatilsController>(
          builder: (ProductDeatilsController) {
        if (ProductDeatilsController.getProductDetailsInProgress) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final ProductDetailsData productDetailsData =
              _productDetailsController.productDetailsModel.data!.first;
          final List<Color> availableColors =
              getColorsFormString(productDetailsData.color ?? '');
          final List<String> availableSizes =
              getSizesFromString(productDetailsData.size ?? '');
          if(totalAmount ==0 ){
              totalAmount =
              double.tryParse(productDetailsData.product?.price ?? '0.0') ??
                  0.0;
          }
          

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductImageSlider(
                        sliders: [
                          productDetailsData.img1 ?? '',
                          productDetailsData.img2 ?? '',
                          productDetailsData.img3 ?? '',
                          productDetailsData.img4 ?? '',
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    productDetailsData.product?.title ?? '',
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 90,
                                  child: IncDecFormField(
                                    onchange: (newValue) {
                                      totalAmount = (double.tryParse(productDetailsData.product?.price ?? '0') ?? 0.0 );
                                      setState(() {
                                        
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text((productDetailsData.product?.star ?? 0.0)
                                    .toStringAsFixed(1)),
                                SizedBox(
                                  width: 8,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Reviews',
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Color',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (int i = 0;
                                      i < availableColors.length;
                                      i++)
                                    InkWell(
                                      onTap: () {
                                        selectedColor = availableColors[i];
                                        setState(() {});
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          backgroundColor: availableColors[i],
                                          radius: 16,
                                          child: selectedColor ==
                                                  availableColors[i]
                                              ? Icon(Icons.check)
                                              : null,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Size',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (int i = 0; i < 5; i++)
                                    InkWell(
                                      onTap: () {
                                        selectedSize = availableSizes[i];
                                        setState(() {});
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: selectedSize ==
                                                      availableSizes[i]
                                                  ? AppColors.primaryColor
                                                      .withOpacity(0.5)
                                                  : null,
                                              border: Border.all(
                                                color: Colors.black54,
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(availableSizes[i]),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Description',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              productDetailsData.product?.shortDes ?? '' ,
                              style: TextStyle(
                                fontSize: 13,
                                letterSpacing: 0.2,
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding:const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.20),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Total Price',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '\$$totalAmount',
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
                        child: AppElevatedButton(
                            onTap: () {}, text: 'Add To Cart')),
                  ],
                ),
              ),
            ],
          );
        }
      },
      ),
    );
  }

  List<Color> getColorsFormString(String colors) {
    List<Color> hexaColors = [];
    final List<String> allcolors = colors.split(',');
    for (var element in allcolors) {
      hexaColors.add(HexColor(element));
    }
    return hexaColors;
  }
}

List<String> getSizesFromString(String sizes) {
  return sizes.split(',');
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
