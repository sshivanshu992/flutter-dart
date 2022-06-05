import 'package:firebase_auth_app/firebase_options.dart';
import 'package:firebase_auth_app/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const FirebaseCreateLoginApp());
}

class FirebaseCreateLoginApp extends StatelessWidget {
  const FirebaseCreateLoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterUserForm(),
    );
  }
}
