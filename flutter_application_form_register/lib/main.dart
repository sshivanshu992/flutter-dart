import 'package:flutter/material.dart';
import 'package:flutter_application_form_register/screens/page2.dart';
import 'package:flutter_application_form_register/screens/register.dart';
import 'package:flutter_application_form_register/screens/user_details.dart';

void main() {
runApp(
MaterialApp(
debugShowCheckedModeBanner: false,
initialRoute: '/',
routes: {
'/': (context) => const Register(),
'/second': (context) => const PageTwo(),
UserDetailsScreen.routeName: (context) => const UserDetailsScreen(),
},
),
);
}