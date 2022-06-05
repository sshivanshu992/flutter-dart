import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_provider_mixin.dart';

class CounterText extends StatelessWidget {
  const CounterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.watch<Counter>().count}',
      style: const TextStyle(fontSize: 30, color: Colors.pinkAccent),
    );
  }
}
