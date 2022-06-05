import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project_app_day_23/controllers/cart_controller.dart';
import 'package:test_project_app_day_23/controllers/shopping_control.dart';

import 'user_cart_screen.dart';

class ProductsList extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final userCartController = Get.put(CartController());
  ProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Catalog'),
        actions: [
          GestureDetector(
            onTap: (() {
              Get.to(const UserCartScreen());
            }),
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Badge(
                toAnimate: false,
                child: const Icon(Icons.shopping_cart),
                badgeContent: GetX<CartController>(
                  builder: ((controller) {
                    return Text(
                      controller.selectedProducts.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    );
                  }),
                ),
              ),
            ),
          )
        ],
      ),
      // GetX
      body: GetX<ShoppingController>(
        builder: ((controller) {
          return ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(controller.products[index].imageUrl),
                title: Text(controller.products[index].productName),
                subtitle: Text(controller.products[index].price.toString()),
                trailing: ElevatedButton(
                  child: const Text('Add'),
                  onPressed: () {
                    userCartController
                        .addProductToCart(controller.products[index]);
                  },
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
