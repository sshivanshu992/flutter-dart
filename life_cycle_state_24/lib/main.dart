import 'package:flutter/material.dart';

// import 'lifecycle_activities/page_one.dart';
import 'screens/simple_calculator_app.dart';

// void main(List<String> args) {
//   runApp(
//     const MaterialApp(
//       home: PageOne(),
//     ),
//   );
// }

void main(List<String> args) {
  runApp(
    const MaterialApp(
      home: CalculatorOnlyForAddMult(),
    ),
  );
}
