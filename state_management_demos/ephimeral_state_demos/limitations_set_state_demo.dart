import 'package:flutter/material.dart';
import 'package:note_with_login/state_management_demos/ephimeral_state_demos/widget1.dart';
import 'package:note_with_login/state_management_demos/ephimeral_state_demos/widget2.dart';
import 'package:note_with_login/state_management_demos/ephimeral_state_demos/widget3.dart';

import 'my_counter_class.dart';



class LimitationsOfSetStateDemo extends StatefulWidget {
  const LimitationsOfSetStateDemo({Key? key}) : super(key: key);

  @override
  State<LimitationsOfSetStateDemo> createState() =>
      _LimitationsOfSetStateDemoState();
}

class _LimitationsOfSetStateDemoState extends State<LimitationsOfSetStateDemo> {
  var myCounter = MyCounter(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Limitations of setState method'),
      ),
      body: Column(
        children: [
          const Widget1(),
          const Divider(thickness: 5),
          Widget2(myCounter: myCounter),
          const Divider(thickness: 5),
          Widget3(myCounter: myCounter),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            myCounter.increaseCount();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
