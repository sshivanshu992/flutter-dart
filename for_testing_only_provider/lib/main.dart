import 'package:flutter/material.dart';
import 'package:for_testing_only_provider/screens/drage_home_screen.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Slider test'),
        ),
        body: SliderHomeScreen(),
      ),
    ),
  );
}
