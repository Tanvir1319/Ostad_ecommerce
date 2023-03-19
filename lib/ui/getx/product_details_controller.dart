import 'package:get/get.dart';
import 'package:ostad_ecommerce/data/models/product_details_model.dart';
import 'package:ostad_ecommerce/data/network_utils.dart';
import 'package:ostad_ecommerce/data/urls.dart';

class ProductDeatilsController extends GetxController {
  ProductDetailsModel productDetailsModel = ProductDetailsModel();
  bool getProductDetailsInProgress = false;

  Future<bool> getProductDetailsById(int id) async {
    getProductDetailsInProgress = true;
    update();
    final response =
        await NetworkUtlis().getMethod(Urls.productDetailsByIdUrl(id));
    getProductDetailsInProgress = false;
    if (response != null && response['success'] == 'success') {
      productDetailsModel = ProductDetailsModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
