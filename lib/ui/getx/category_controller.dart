import 'package:get/get.dart';
import 'package:ostad_ecommerce/data/models/category_model.dart';
import 'package:ostad_ecommerce/data/network_utils.dart';
import 'package:ostad_ecommerce/data/urls.dart';

class CategoryController extends GetxController {
  CategoryModel categoryModel = CategoryModel();
  bool getCategoryInProgress = false;

  Future<bool> getCategories() async {
    getCategoryInProgress = true;
    update();
    final response = await NetworkUtlis().getMethod(Urls.productCategoryUrl);
    getCategoryInProgress = false;
    if (response != null) {
      categoryModel = CategoryModel.fromJson(response);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
