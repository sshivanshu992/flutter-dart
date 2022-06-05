import 'package:flutter/material.dart';

class CounterAppRemoveAddBothButton extends StatefulWidget {
  const CounterAppRemoveAddBothButton({Key? key}) : super(key: key);

  @override
  State<CounterAppRemoveAddBothButton> createState() =>
      _CounterAppRemoveAddBothButtonState();
}

class _CounterAppRemoveAddBothButtonState
    extends State<CounterAppRemoveAddBothButton> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.mobile_friendly),
        title: const Text('Counter App version 0.1'),
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Text(
            'You have clicks $_counter times',
            style: const TextStyle(fontSize: 20.0),
          ),
        ),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        FloatingActionButton(
          onPressed: () {
            //? setp 4
            setState(() {
              _counter++;
            });
          },
          child: const Icon(Icons.add),
        ),
        const SizedBox(
          width: 20.0,
        ),
        FloatingActionButton(
          onPressed: () {
            //? setp 4
            setState(() {
              _counter--;
            });
          },
          child: const Icon(Icons.remove),
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, //set the button bottom center
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellowAccent,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
    );
  }
}
