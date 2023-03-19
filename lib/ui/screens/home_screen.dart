import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommerce/ui/getx/bottom_navigation_controller.dart';
import 'package:ostad_ecommerce/ui/getx/category_controller.dart';
import 'package:ostad_ecommerce/ui/getx/home_controller.dart';
import 'package:ostad_ecommerce/ui/getx/product_controller.dart';
import 'package:ostad_ecommerce/ui/screens/product_list_screen.dart';
import 'package:ostad_ecommerce/ui/utils/app_colors.dart';
import 'package:ostad_ecommerce/ui/widgets/CategoryItemWidget.dart';
import 'package:ostad_ecommerce/ui/widgets/home/HomeBannerSlider.dart';
import 'package:ostad_ecommerce/ui/widgets/home/ProductItemPreviewCard.dart';
import 'package:ostad_ecommerce/ui/widgets/home/sectionHeader.dart';


//check done


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BottomNavigationController bottomNavigationController =
      Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: SvgPicture.asset('assets/images/logo_app.svg'),
        actions: [
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.grey.shade200,
            child: Icon(
              Icons.person,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.grey.shade200,
            child: Icon(
              Icons.notifications,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          CircleAvatar(
            radius: 16,
            backgroundColor: Colors.grey.shade200,
            child: Icon(
              Icons.phone,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              //carosel slider start
              GetBuilder<HomeController>(builder: (homeController) {
                if (homeController.getProductSliderInProgress) {
                  return CircularProgressIndicator();
                } else {
                  return HomeBannerSlider(
                    productSliderModel: homeController.productSliderModel,
                  );
                }
              }),

              SectionHeader(
                headerName: 'Categories',
                onTapSeeAll: () {
                  bottomNavigationController.changeIndex(1);
                },
              ),
              SizedBox(
                height: 10,
              ),
              GetBuilder<CategoryController>(builder: (controller) {
                if (controller.getCategoryInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.categoryModel.data?.length ?? 0,
                        itemBuilder: (context, index) {
                         return CategoryItemWidget(
                           

                            onTap: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListScreen(
                                   categoryName: controller.categoryModel.data![index].categoryName ?? '',
                                   categoryId:'${controller.categoryModel.data![index].id ?? 1}' ),
                      ));
                            },
                            image: controller
                               .categoryModel.data![index].categoryImg ??
                               '',
                            CategoryItemName: controller
                                    .categoryModel.data![index].categoryName ??
                                '',
                          );
                        }),
                  );
                }
              }),

              SizedBox(
                height: 10,
              ),

              SectionHeader(
                headerName: 'Popular',
                onTapSeeAll: () {},
              ),
              GetBuilder<ProductController>(builder: (ProductController) {
                if (ProductController.popularInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else{
                  return SizedBox(
                  height: 240,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          ProductController.popularProductModel.data?.length ??
                              0,
                      itemBuilder: (context, index) {
                        return ProductItemPreviewCard(
                          productData: ProductController.popularProductModel.data![index],
                        );
                      }),
                );
                }
              }),

              SizedBox(
                height: 12,
              ),
              SectionHeader(
                headerName: 'Special',
                onTapSeeAll: () {},
              ),
              SizedBox(
                height: 10,
              ),
                GetBuilder<ProductController>(builder: (ProductController) {
                if (ProductController.specialInProgress) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else{
                  return SizedBox(
                  height: 240,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          ProductController.specialProductModel.data?.length ??
                              0,
                      itemBuilder: (context, index) {
                        return ProductItemPreviewCard(
                          productData: ProductController.specialProductModel.data![index],
                        );
                      }),
                );
                }
              }),

              
              SizedBox(
                height: 12,
              ),
              SectionHeader(
                headerName: 'New',
                onTapSeeAll: () {},
              ),
              SizedBox(
                height: 10,
              ),
                  GetBuilder<ProductController>(builder: (ProductController) {
                if (ProductController.newInProgress) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                else{
                  return SizedBox(
                  height: 240,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          ProductController.newProductModel.data?.length ??
                              0,
                      itemBuilder: (context, index) {
                        return ProductItemPreviewCard(
                          productData: ProductController.newProductModel.data![index],
                        );
                      }),
                );
                }
              }),

             
            ],
          ),
        ),
      ),
    );
  }
}
