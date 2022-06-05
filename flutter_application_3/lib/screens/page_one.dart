import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/page_two.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text('Page One'),
        // automaticallyImplyLeading: false,
      ),
      body: const Center(
          child: Text(
        'Welcome to First Page!',
        style: TextStyle(fontSize: 30.0),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var navigationResult = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PageTwo(),
            ),
          );
          if (navigationResult != null) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                  title: const Text('Result \n'),
                  content: Text('Data Recieved :\n$navigationResult')),
            );
          } else {
            showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                title: Text('Navigation Done using Back button on AppBar'),
              ),
            );
          }
        },
        child: const Icon(Icons.arrow_forward_rounded),
      ),
    );
  }
}
