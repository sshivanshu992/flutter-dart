import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x/getx_folder/count_getx.dart';

class CounterAppWithGetX extends StatelessWidget {
  CounterControllerUsingGetX controller = Get.put(CounterControllerUsingGetX());
  CounterAppWithGetX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<CounterControllerUsingGetX>(
              builder: (_) => Text(
                'You have clicked: ${controller.counter} times',
                style: const TextStyle(fontSize: 30),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            controller.increment();
          }),
    );
  }
}
