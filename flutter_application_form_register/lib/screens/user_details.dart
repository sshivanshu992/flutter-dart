import 'package:flutter/material.dart';
import 'package:flutter_application_form_register/models/registration_form.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);
  static const String routeName = "/UserDetails";
  @override
  Widget build(BuildContext context) {
    final UserRegistrationForm userInfo =
        ModalRoute.of(context)!.settings.arguments as UserRegistrationForm;
    return Scaffold(
      appBar: AppBar(
        title: Text('{$userInfo.userName} details'),
      ),
      body: SizedBox(
        width: 400.0,
        height: 400.0,
        child: Card(
          elevation: 20,
          color: Colors.purple,
          child: Column(
            children: [
              Row(
                children: [
                  const Text('User name: '),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text('($userInfo.userName'),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const Text('Email Id : '),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text('$userInfo.emailid'),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const Text('Mobile : '),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text('$userInfo.mobile'),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const Text('Password : '),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text('$userInfo.passwrd'),
                ],
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
