import 'package:flutter/material.dart';

class ListViewsDemo extends StatelessWidget {
  const ListViewsDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('List Views'),
        ),
        body: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.all(8),
              child: Card(
                elevation: 10,
                shadowColor: Colors.red,
                child: ListTile(
                  title: Text('this is a basic list view app'),
                  trailing: Icon(Icons.forward),
                ),
              ),
            ),
            Card(
              ///for shadow size
              elevation: 10.0,
              child: ListTile(
                title: Text('this is a basic list view app'),
                trailing: Icon(Icons.forward),
              ),
            ),
            ListTile(
              title: Text('this is a basic list view app'),
              trailing: Icon(Icons.forward),
            ),
            ListTile(
              title: Text('this is a basic list view app'),
            ),
            ListTile(
              title: Text('this is a basic list view app'),
            ),
            ListTile(
              title: Text('this is a basic list view app'),
            ),
            ListTile(
              title: Text('this is a basic list view app'),
            ),
          ],
        ),
      ),
    );
  }
}
