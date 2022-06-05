import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/main_product.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductsList(),
    );
  }
}

Future main(List<String> args) async {
  runApp(const MyApp());
}
