import 'package:cart_app_using_provider/provider_demo/cart_mixin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserCartScreen extends StatefulWidget {
  static const String routeName = '/userCart';
  const UserCartScreen({Key? key}) : super(key: key);

  @override
  State<UserCartScreen> createState() => _UserCartScreenState();
}

class _UserCartScreenState extends State<UserCartScreen> {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<Cart>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selected Products'),
      ),
      body: Column(
        children: [
          _CartItems(cart: cart),
          const SizedBox(height: 20.0),
          Text(
            'Total Price of the Cart : \nRs. ${cart.totalPrice()} /-',
            style: const TextStyle(fontSize: 24.0, color: Colors.purple),
          ),
        ],
      ),
    );
  }
}

class _CartItems extends StatelessWidget {
  final Cart cart;
  const _CartItems({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: cart.cardProducts.length,
      itemBuilder: (context, index) {
        return Expanded(
          child: ListTile(
            leading: Image.network(cart.cardProducts[index].imageUrl),
            title: Text(cart.cardProducts[index].productName),
            subtitle: Text(cart.cardProducts[index].price.toString()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 10),
                ElevatedButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    cart.incrementProductFromCart(index);
                  },
                ),
                const SizedBox(width: 10),
                Text(cart.cardProducts[index].quantity.toString()),
                const SizedBox(width: 10),
                ElevatedButton(
                  child: const Icon(Icons.remove),
                  onPressed: () {
                    cart.deIncrementProductFromCart(index);
                  },
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  child: const Icon(
                    Icons.remove_shopping_cart,
                  ),
                  onPressed: () {
                    cart.removeProductFromCart(cart.cardProducts[index]);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
