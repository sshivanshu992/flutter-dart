import 'package:flutter/material.dart';
// import 'package:flutter_application_3/screens/page_one.dart';
import 'package:flutter_application_3/screens/page1.dart';
import 'package:flutter_application_3/screens/page2.dart';
// import 'package:flutter_application_3/screens/first_screen_bmi_app.dart';

// void main(List<String> args) {
//   runApp(
//     const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: BmiApplication(),
//     ),
//   );
// }

void main(List<String> args) {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const PageOne(),
        '/second': (context) => const PageTwo()
      },
    ),
  );
}
