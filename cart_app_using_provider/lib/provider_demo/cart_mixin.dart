import 'package:cart_app_using_provider/models/product.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  List<Product> _products = [];
  List<Product> get cardProducts => _products;

  void addProductToCart(Product product) {
    _products.add(product);
    debugPrint('Adding Product : ${product.productName}');
    notifyListeners();
  }

  void removeProductFromCart(Product product) {
    _products.remove(product);
    notifyListeners();
  }

  void incrementProductFromCart(index) {
    var q = cardProducts[index].quantity++;
    cardProducts[index].price * q;
    notifyListeners();
  }

  void deIncrementProductFromCart(index) {
    if (cardProducts[index].quantity >= 1) {
      var q = cardProducts[index].quantity--;
      cardProducts[index].price * q;
      notifyListeners();
    }
    notifyListeners();
  }

  // double get totalPrice => cardProducts.fold(
  //     0, (total, currentProduct) => total + currentProduct.price);

  double totalPrice() {
    double total = 0;
    for (int i = 0; i < cardProducts.length; i++) {
      total += cardProducts[i].price * cardProducts[i].quantity;
    }
    notifyListeners();
    return total;
  }
}
