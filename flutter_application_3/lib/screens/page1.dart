import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text('Page One'),
        // automaticallyImplyLeading: false, // for remove the errow button from the headerx`
      ),
      body: const Center(
          child: Text(
        'Welcome to First Page!',
        style: TextStyle(fontSize: 30.0),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/second');
        },
        child: const Icon(Icons.arrow_forward_rounded),
      ),
    );
  }
}
