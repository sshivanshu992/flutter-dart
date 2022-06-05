import 'package:flutter/material.dart';

class ListViewSeparatedDemo extends StatelessWidget {
  final List<String> _course = [
    '.net is very power full language',
    'Python is one of the Best language',
    'Dart is used for Mobile/web development'
  ];

  ListViewSeparatedDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('List Views Separated'),
        ),
        body: ListView.separated(
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                color: Colors.blueAccent,
                elevation: 10,
                shadowColor: Colors.greenAccent,
                child: ListTile(
                  title: Text(_course[index]),
                ),
              ),
            );
          }),
          separatorBuilder: (context, index) => const Divider(
            thickness: 2.0,
            color: Colors.black,
          ),
          itemCount: _course.length,
        ),
      ),
    );
  }
}
