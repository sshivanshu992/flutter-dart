import 'package:flutter/material.dart';
import 'package:note_app/screens/login_screen.dart';
import 'package:note_app/screens/note_list_page.dart';
import 'package:note_app/screens/sign_up_screen.dart';

Future main() async {
  runApp(const MaterialApp(
    home: LoginScreen(),
  ));
}

class MyNotesDbApp extends StatelessWidget {
  const MyNotesDbApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          primaryColor: Colors.black,
          scaffoldBackgroundColor: Colors.blueGrey.shade900,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent, elevation: 0),
        ),
        home: const NoteListPage());
  }
}
