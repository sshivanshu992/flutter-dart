import 'package:firebase_projects/models/user_register_modal.dart';
import 'package:firebase_projects/screens/get_user_data.dart';
import 'package:flutter/material.dart';

class RegisterUserForm extends StatefulWidget {
  const RegisterUserForm({Key? key}) : super(key: key);

  @override
  State<RegisterUserForm> createState() => _RegisterUserFormState();
}

class _RegisterUserFormState extends State<RegisterUserForm> {
  var userController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: userController,
                    keyboardType: TextInputType.text,
                    decoration:
                        const InputDecoration(labelText: 'Enter Username'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter username';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        const InputDecoration(labelText: 'Enter Email Id'),
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
                    keyboardType: TextInputType.text,
                    decoration:
                        const InputDecoration(labelText: 'Enter Password'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Password';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: (() {
                      if (_formKey.currentState!.validate()) {
                        RegisterUser(
                                userName: userController.text,
                                password: passwordController.text,
                                emailId: emailController.text)
                            .addUser();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  const GetUserInformation())),
                        );
                      }
                    }),
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
