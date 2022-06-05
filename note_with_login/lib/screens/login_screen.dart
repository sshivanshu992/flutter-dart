import 'package:flutter/material.dart';
import 'package:note_with_login/db/database.dart';
import 'package:note_with_login/screens/sign_up_screen.dart';
import 'package:note_with_login/screens/succes.dart';
import 'package:provider/provider.dart';

import '../models/user_models.dart';
import '../providers/providder_file.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passrdController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  String name = '';

  late User user;

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
                SizedBox(height: height * 0.04),
                const Center(
                  child: Text(
                    'Note App',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.blueAccent,
                        letterSpacing: 2.0),
                  ),
                ),
                SizedBox(height: height * 0.05),
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
                SizedBox(height: height * 0.05),
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
                SizedBox(height: height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text(User.email),

                    ElevatedButton(
                      onPressed: () async {
                        // i'm checking here form field enter value right or not
                        if (formkey.currentState!.validate()) {
                          //here i'm checking, Email id password valid or not in database system
                          if (await MyDatabase.instance.validUser(emailController.text, passrdController.text)) {

                                user = await MyDatabase.instance.getUserInfo(emailController.text);
                                
                            context.read<UserIdProvider>().userEmailIdForProvider(user);

                            Navigator.pushNamed(context, Success.routeName);
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                // title: Text('Invalid User!'),
                                content: Text('Invalied Email / Password!'),
                              ),
                            );
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
                SizedBox(height: height * 0.07),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                        // Navigator.pop(context);
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                            color: Colors.blueAccent, letterSpacing: 2.0),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgete your password',
                        style: TextStyle(
                            color: Colors.grey.shade700, letterSpacing: 2.0),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
