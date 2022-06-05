import 'package:get/get.dart';

import '../models/product.dart';

class CartController extends GetxController {
  List<Product> selectedProducts = <Product>[].obs;

  void addProductToCart(Product product) {
    selectedProducts.add(product);
  }

  void removeProductsFromCart(Product product) {
    selectedProducts.remove(product);
  }

  double get totalCost => selectedProducts.fold(
      0,
      (previousValue, selectedProduct) =>
          previousValue + selectedProduct.price);
}
