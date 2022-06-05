import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/state_management_demos/provider_demos/counter_text_Widget.dart';

import 'counter_provider_mixin.dart';

class ProviderCounter extends StatelessWidget {
  const ProviderCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('State Management using provider'),
        ),
        body: Center(
          child: Column(
            children: const [
              Text('You have Clicked'),
              SizedBox(
                height: 10.0,
              ),
              CounterText(),
              SizedBox(
                height: 10.0,
              ),
              Text('Times'),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () => context.read<Counter>().increment(),
            )
          ],
        ));
  }
}
