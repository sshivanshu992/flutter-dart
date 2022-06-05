import 'package:flutter/material.dart';
import 'package:note_with_login/state_management_demos/ephimeral_state_demos/widget3.dart';

import 'my_counter_class.dart';

class Widget2 extends StatelessWidget {
  final MyCounter myCounter;
  const Widget2({Key? key, required this.myCounter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Widget 2 : ${myCounter.counter}',
          style: const TextStyle(fontSize: 24.0),
        ),
        Widget3(myCounter: myCounter),
      ],
    );
  }
}
