import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  State<CounterApp> createState() => _CounterAppState();
}

//? setp 2
class _CounterAppState extends State<CounterApp> {
  //? setp 2.1
  int _counter = 0;

  //? setp 3
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.mobile_friendly),
        title: const Text('Counter App'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.lightBlue,
            // Colors.blueGrey,
            Colors.lightBlueAccent,
          ]),
        ),
        child: Center(
          child: Text.rich(
            TextSpan(
                text: 'You have Clicked',
                style: const TextStyle(fontSize: 20.0),
                children: [
                  TextSpan(
                    text: ' $_counter ',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 172, 76, 175),
                    ),
                  ),
                  const TextSpan(
                    text: ' Times',
                    style: TextStyle(fontSize: 20.0),
                  )
                ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //? setp 4
          setState(() {
            _counter++;
          });
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.amberAccent,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
          // color: Colors.white,
        ),
      ),
    );
  }
}
