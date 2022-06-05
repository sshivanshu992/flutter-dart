import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.mobile_friendly),
        title: const Text('Counter App'),
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        child: Center(
          child: Text(
            'you have clicked $_counter times',
            style: const TextStyle(fontSize: 30.0),
          ),
        ),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        FloatingActionButton(
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
          child: const Icon(Icons.add),
        ),
        const SizedBox(
          width: 10.0,
        ),
        FloatingActionButton(
          onPressed: () {
            setState(() {
              if (_counter > 0) _counter--;
            });
          },
          child: const Icon(Icons.remove),
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        // shape: const CircularNotchedRectangle(),
        child: Container(
        color: Colors.amber,
          height: 50.0,
        ),
      ),
    );
  }
}
