import 'package:flutter/material.dart';
import 'package:note_with_login/state_management_demos/ephimeral_state_demos/limitations_set_state_demo.dart';

void main(List<String> args) {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LimitationsOfSetStateDemo(),
    ),
  );
}
