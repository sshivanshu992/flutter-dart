import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_app/screens/welcome_page.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController unameController = TextEditingController();
  TextEditingController passwdController = TextEditingController();

  bool? _rememberMe = false;

  final _formKey = GlobalKey<FormState>();
  void dispose() {
    // Clean up the controller
    unameController.dispose();
    unameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login From'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: unameController,
                decoration: InputDecoration(
                  labelText: 'User name',
                  hintText: 'User name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "User name can't be blank";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: passwdController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password can't be blank";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value;
                      });
                      print('In side loging page :; $_rememberMe');
                    },
                  ),
                  const SizedBox(width: 10.0),
                  Text('Remember me, $_rememberMe'),
                ],
              ),
              Center(
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate() && _rememberMe!) {
                      SharedPreferences myPrefs =
                          await SharedPreferences.getInstance();
                      myPrefs.setBool('remember', _rememberMe!);
                      myPrefs.setString('uname', unameController.text);
                      myPrefs.setString('passwd', passwdController.text);
                      Navigator.pushNamed(context, WelcomePage.routeName);
                    } else if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(
                        context,
                        WelcomePage.routeName,
                        arguments: WelcomePage(
                            username: unameController.text,
                            password: passwdController.text),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
