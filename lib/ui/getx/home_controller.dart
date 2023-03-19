import 'package:get/get.dart';
import 'package:ostad_ecommerce/data/models/product_slider_model.dart';
import 'package:ostad_ecommerce/data/network_utils.dart';
import 'package:ostad_ecommerce/data/urls.dart';

class HomeController extends GetxController {
  ProductSliderModel productSliderModel = ProductSliderModel();
  bool getProductSliderInProgress = false;
  Future<bool> getProductSliderList() async {
    getProductSliderInProgress = true;
    update();
    final result = await NetworkUtlis().getMethod(Urls.productSliderUrl);
    getProductSliderInProgress = false;

    if (result != null ) {
      productSliderModel = ProductSliderModel.fromJson(result);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
