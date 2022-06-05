import 'package:flutter/material.dart';

import 'counter_inherited_widget.dart';
import 'my_counter.dart';

class Widget3 extends StatelessWidget {
  const Widget3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyInheritCounter myInheritCounter =
        CounterInheritedWidget.of(context)!.myInheritCounter;
    return Text(
      'Widget 3 : ${myInheritCounter.counter}',
      style: const TextStyle(fontSize: 24.0),
    );
  }
}
