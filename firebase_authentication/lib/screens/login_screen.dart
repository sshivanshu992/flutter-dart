import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../statemanagement/with_getx/controllers/authentication_service_controllers.dart';
import 'get_user_data.dart';
import 'register_screen.dart';

class SignInUserPage extends StatefulWidget {
  const SignInUserPage({Key? key}) : super(key: key);

  @override
  State<SignInUserPage> createState() => _SignInUserPageState();
}

class _SignInUserPageState extends State<SignInUserPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  AuthenticationServiceController controller =
      Get.put(AuthenticationServiceController());

  // Future<void> signInUser(emailAddress, password) async {
  //   try {
  //     final credential = await FirebaseAuth.instance
  //         .signInWithEmailAndPassword(email: emailAddress, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');

  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFffffff),
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        // elevation: 0,
        title: const Text('login User'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter email Id';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Password';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: (() async {
                          if (_formKey.currentState!.validate()) {
                            dynamic status = await controller.validateUser(
                                emailController.text, passwordController.text);
                            if (status == 'true') {
                              Get.to(() => const UserDetailsFromFirebase());
                            } else {
                              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              //     backgroundColor: Colors.redAccent,
                              //     content: Text('$status')));
                              Get.snackbar('Error', '$status');
                            }
                          }
                        }),
                        child: const Text('Save'),
                      ),
                      TextButton(
                        onPressed: (() {
                          Get.to(() => const RegisterUserForm());
                        }),
                        child: const Text('Sign Up'),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
