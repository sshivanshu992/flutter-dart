//? Step 1 : import the library
import 'package:flutter/material.dart';

/// setp 2: Define the main function

void main(List<String> args) {
  runApp(
    //? setp 3: Define the widget as per the reuirements
    const Center(
      child: Text(
        "Hello World!",
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 30.0, color: Colors.purple),
      ),
    ),
  );
}
