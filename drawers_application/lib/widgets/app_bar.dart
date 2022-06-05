import 'package:flutter/material.dart';

class AppBarWidgets extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;
  const AppBarWidgets(this.title, {Key? key})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
        
      ),
      automaticallyImplyLeading: true,
    );
  }
}
