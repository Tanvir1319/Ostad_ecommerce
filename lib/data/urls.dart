class Urls {
  static const String baseUrl = 'https://craftybay.teamrabbil.com/api';
  static const String productSliderUrl = '$baseUrl/ListProductSlider';
  static const String productCategoryUrl = '$baseUrl/CategoryList';
  static  String productByRemarkUrl(String remarks) => '$baseUrl/ListProductByRemark/$remarks';
  static  String productByCategoryId(String categoryId) => '$baseUrl/ListProductByCategory/$categoryId';
  static  String productDetailsByIdUrl(int productId) => '$baseUrl/ProductDetailsById/$productId';
}



//https://github.com/moniruzzaman76/E-commerce-Project.git