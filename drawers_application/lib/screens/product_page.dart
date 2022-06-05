import 'package:drawers_application/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  var products = ProductService().getProducts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Products'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Hero(
                tag: products[index].productId,
                child: Image.network(products[index].imageUrl)),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              // Navigator.pushNamed(context, arg)
            },
          );
        },
      ),
    );
  }
}
