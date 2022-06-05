import 'package:flutter/material.dart';
import 'package:state_management/state_management_demos/inherited_widgets_demos/widget3.dart';
import 'my_counter.dart';

class Widget2 extends StatelessWidget {
  final MyInheritCounter myInheritCounter;
  const Widget2({Key? key, required this.myInheritCounter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Widget 2 : ${myInheritCounter.counter}',
          style: const TextStyle(fontSize: 24.0),
        ),
        Widget3(),
      ],
    );
  }
}
