import 'package:flutter/material.dart';
import 'package:note_with_login/db/database.dart';
import 'package:note_with_login/models/user_models.dart';
import 'package:note_with_login/screens/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var passrdController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  String name = '';

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(children: [
        Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: formkey, //key for form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.02),
                const Text(
                  'Note App',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blueAccent,
                      letterSpacing: 2.0),
                ),
                const Text(
                  'Welcome!',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blueAccent,
                      letterSpacing: 2.0),
                ),
                SizedBox(height: height * 0.02),
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration:
                      const InputDecoration(labelText: 'Enter you name'),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return 'Enter correct name';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: height * 0.02),
                TextFormField(
                  controller: mobileController,
                  keyboardType: TextInputType.text,
                  decoration:
                      const InputDecoration(labelText: 'Enter Mobile number'),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s./0-9]')
                            .hasMatch(value)) {
                      return 'Enter correct mobile number';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: height * 0.02),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration:
                      const InputDecoration(labelText: 'Enter your email'),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                            .hasMatch(value)) {
                      return 'Enter correct Email';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: height * 0.02),
                TextFormField(
                  obscureText: true,
                  controller: passrdController,
                  keyboardType: TextInputType.text,
                  decoration:
                      const InputDecoration(labelText: 'Enter your Password'),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\&*-]).{8,}$')
                            .hasMatch(value)) {
                      return 'Password must be Aa1@';
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.blueAccent, letterSpacing: 2.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          if (await MyDatabase.instance
                              .isUserExists(emailController.text)) {
                            addUser();
                            Navigator.pushNamed(context, LoginScreen.routeName);
                          } else {
                            print('Email Id Already Exists');
                          }
                        }
                      },
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        size: 30,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(24),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Future addUser() async {
    final user = User(
      username: nameController.text,
      mobile: mobileController.text,
      email: emailController.text,
      password: passrdController.text,
    );
    await MyDatabase.instance.registerUser(user);
  }

  // Future<bool> isExists(String email) async {
  //   return await MyDatabase.instance.isUserExists(email);
  // }
}
