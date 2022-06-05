import 'package:flutter/material.dart';
import 'package:flutter_application_form_register/models/registration_form.dart';
import 'package:flutter_application_form_register/screens/user_details.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var unameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var passrdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          createTextField(unameController, 'User name'),
          createTextField(emailController, 'Email Id'),
          createTextField(mobileController, 'Mobile no',
              keyboard: TextInputType.phone),
          createTextField(passrdController, 'Password', isSecured: true),
          ElevatedButton(
            onPressed: () {
              _onRegister();
            },
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }

  TextField createTextField(TextEditingController editController, String text,
      {TextInputType keyboard = TextInputType.text, bool isSecured = false}) {
    return TextField(
      controller: editController,
      obscureText: isSecured,
      keyboardType: keyboard,
      decoration: InputDecoration(labelText: text, hintText: 'Enter $text'),
      style: Theme.of(context).textTheme.bodyText1,
    );
  }

  void _onRegister() {
    String uname = unameController.text;
    String email = unameController.text;
    String mobile = unameController.text;
    String passwd = unameController.text;
    Navigator.pushNamed(context, UserDetailsScreen.routeName,
        arguments: UserRegistrationForm(uname, email, mobile, passwd));
  }
}
