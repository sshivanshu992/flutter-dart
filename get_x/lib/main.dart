import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateManagementDemoApp extends StatelessWidget {
  const StateManagementDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}

Future main(List<String> args) async {
  runApp(
    const StateManagementDemoApp(),
  );
}
