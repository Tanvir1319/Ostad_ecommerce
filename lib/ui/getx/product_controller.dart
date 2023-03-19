import 'package:get/get.dart';
import 'package:ostad_ecommerce/data/models/product_details_model.dart';
import 'package:ostad_ecommerce/data/models/product_model.dart';
import 'package:ostad_ecommerce/data/network_utils.dart';
import 'package:ostad_ecommerce/data/urls.dart';

class ProductController extends GetxController {
  ProductModel popularProductModel = ProductModel();
  ProductModel specialProductModel = ProductModel();
  ProductModel newProductModel = ProductModel();
  ProductModel productByCategoryModel = ProductModel();
  

  bool popularInProgress = false;
  bool specialInProgress = false;
  bool newInProgress = false;
  bool productCategoryInProgress = false;

  Future<bool> getPopularProducts() async {
    popularInProgress = true;
    update();
    final response =
        await NetworkUtlis().getMethod(Urls.productByRemarkUrl('popular'));
    popularInProgress = false;
    if (response != null && response['msg'] == 'success') {
      popularProductModel = ProductModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> getNewProducts() async {
    newInProgress = true;
    update();
    final response =
        await NetworkUtlis().getMethod(Urls.productByRemarkUrl('new'));
    newInProgress = false;
    if (response != null && response['msg'] == 'success') {
      newProductModel = ProductModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> getSpecialProducts() async {
    specialInProgress = true;
    update();
    final response =
        await NetworkUtlis().getMethod(Urls.productByRemarkUrl('special'));
    specialInProgress = false;
    if (response != null && response['msg'] == 'success') {
      specialProductModel = ProductModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> getProductsByCategory(String categoryId) async {
    productCategoryInProgress = true;
    update();
    final response =
        await NetworkUtlis().getMethod(Urls.productByCategoryId(categoryId));
    productCategoryInProgress = false;
    if (response != null && response['msg'] == 'success') {
      specialProductModel = ProductModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
