import 'package:flutter/material.dart';
import 'package:flutter_application_2/new_screens/counter_app.dart';

void main(List<String> args) {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterApp(),
    ),
  );
}
