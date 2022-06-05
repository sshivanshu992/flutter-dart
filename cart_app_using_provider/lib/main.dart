import 'package:cart_app_using_provider/provider_demo/cart_mixin.dart';
import 'package:cart_app_using_provider/screens/product_catalog_screen.dart';
import 'package:cart_app_using_provider/screens/user_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StateManagementUsingCartApp extends StatelessWidget {
  const StateManagementUsingCartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const ProductCatalog(),
        UserCartScreen.routeName: (context) => const UserCartScreen(),
      },
    );
  }
}

Future main(List<String> args) async {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Cart())],
      child: const StateManagementUsingCartApp(),
    ),
  );
}
