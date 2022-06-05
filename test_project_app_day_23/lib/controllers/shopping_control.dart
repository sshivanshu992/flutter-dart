import 'package:get/get.dart';
import 'package:test_project_app_day_23/services/product_service.dart';

import '../models/product.dart';

class ShoppingController extends GetxController {
  List<Product> products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    getProductDetails();
  }

  void getProductDetails() async {
    products.assignAll(ProductService().getProducts().toList());
  }
}
