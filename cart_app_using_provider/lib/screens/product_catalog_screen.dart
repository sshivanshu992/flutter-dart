import 'package:badges/badges.dart';
import 'package:cart_app_using_provider/models/product.dart';
import 'package:cart_app_using_provider/provider_demo/cart_mixin.dart';
import 'package:cart_app_using_provider/screens/user_cart_screen.dart';
import 'package:cart_app_using_provider/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCatalog extends StatefulWidget {
  const ProductCatalog({Key? key}) : super(key: key);

  @override
  State<ProductCatalog> createState() => _ProductCatalogState();
}

class _ProductCatalogState extends State<ProductCatalog> {
  List<Product> products = ProductService().getProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products Catalog'), actions: [
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.only(right: 15, top: 8),
            child: Badge(
              toAnimate: false,
              badgeContent: Text(
                '${context.watch<Cart>().cardProducts.length}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
              child: const Icon(Icons.shopping_cart),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, UserCartScreen.routeName);
          },
        ),
      ]),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.network(products[index].imageUrl),
              title: Text(products[index].productName),
              subtitle: Text(products[index].price.toString()),
              trailing: _AddItemButton(products: products[index]),
            );
          }),
    );
  }
}

class _AddItemButton extends StatefulWidget {
  final Product products;
  const _AddItemButton({Key? key, required this.products}) : super(key: key);

  @override
  State<_AddItemButton> createState() => __AddItemButtonState();
}

class __AddItemButtonState extends State<_AddItemButton> {
  @override
  Widget build(BuildContext context) {
    var isProductExistsInCart = context.select<Cart, bool>(
      (usercart) => usercart.cardProducts.contains(widget.products),
    );

    return isProductExistsInCart
        ? const Icon(Icons.check)
        : ElevatedButton(
            onPressed: () {
              context.read<Cart>().addProductToCart(widget.products);
            },
            child: const Text('Add'),
          );
  }
}
