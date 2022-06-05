import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text('Page Two'),
        // automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text(
          'Welcome to Second Page!',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_rounded),
      ),
    );
  }
}
