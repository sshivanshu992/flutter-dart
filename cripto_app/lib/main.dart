import 'package:cripto_app/screens/coin_main_screen.dart';
import 'package:flutter/material.dart';

Future main(List<String> args) async {
  runApp(const RestAPIService());
}

class RestAPIService extends StatelessWidget {
  const RestAPIService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: CoinApp());
  }
}
