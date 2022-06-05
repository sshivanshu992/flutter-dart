import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_app/screens/login_shared_prefernces.dart';
import 'package:shared_preferences_app/screens/welcome_page.dart';

class SharedApp extends StatefulWidget {
  const SharedApp({Key? key}) : super(key: key);

  @override
  State<SharedApp> createState() => _SharedAppState();
}

class _SharedAppState extends State<SharedApp> {
  bool? remember;
  // var x = false;
  @override
  void initState() {
    super.initState();
     getData();
  }

  Future<void> getData() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    setState(() {
      remember = (myPrefs.getBool('remember') ?? false);

      print('value of : $remember');
      // print('value of x : $x');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        initialRoute: remember! ? WelcomePage.routeName : LoginScreen.routeName,
        // remember ==true ? WelcomePage.routeName : LoginScreen.routeName,

        routes: {
          LoginScreen.routeName: (context) => const LoginScreen(),
          WelcomePage.routeName: (context) => const WelcomePage()
        }

        // home: LoginScreen(),
        );

    //home:   '$name' == '' && '$password' == ''
    //       ? const LoginScreen()
    //       : const WelcomePage();
    //
  }
}

void main(List<String> args) {
  runApp(const SharedApp());
}
