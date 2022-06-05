import 'package:firebase_auth_app/screens/register_screen.dart';
import 'package:firebase_auth_app/statemanagement/with_getx/controllers/authentication_service_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailsFromFirebase extends StatefulWidget {
  const UserDetailsFromFirebase({Key? key}) : super(key: key);

  @override
  State<UserDetailsFromFirebase> createState() =>
      _UserDetailsFromFirebaseState();
}

class _UserDetailsFromFirebaseState extends State<UserDetailsFromFirebase> {
  AuthenticationServiceController controller =
      Get.put(AuthenticationServiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getting Data from firebase'),
        actions: [
          ElevatedButton(
            onPressed: (() {
              controller.logout();
              Get.to(const RegisterUserForm());
            }),
            child: const Text('SignOut'),
          ),
        ],
      ),
    );
  }
}
