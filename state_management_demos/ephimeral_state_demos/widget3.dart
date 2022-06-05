import 'package:flutter/material.dart';

import 'my_counter_class.dart';

class Widget3 extends StatelessWidget {
  final MyCounter myCounter;

  const Widget3({Key? key, required this.myCounter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Widget 3 : ${myCounter.counter}',
      style: const TextStyle(fontSize: 24.0),
    );
  }
}
