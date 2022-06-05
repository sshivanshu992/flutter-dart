import 'package:flutter/material.dart';
import 'package:note_with_login/screens/login_screen.dart';
import 'package:note_with_login/screens/sign_up_screen.dart';
import 'package:note_with_login/screens/succes.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: SignUpScreen.routeName,
      routes: {
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        LoginScreen.routeName: ((context) => const LoginScreen()),
        Success.routeName: ((context) => const Success()),
      },
    ),
  );
}
