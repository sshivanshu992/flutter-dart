import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_app/screens/login_shared_prefernces.dart';

class WelcomePage extends StatefulWidget {
  final String? username;
  final String? password;
  static const String routeName = '/welcome';
  const WelcomePage({Key? key, this.username, this.password}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String? _uname, _passwd;
  // bool? _remember = false;
  late WelcomePage? argv;
  @override
  void initState() {
    super.initState();
    getValues();
  }

  Future<void> getValues() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    setState(() {
      // _remember = myPrefs.getBool('remember') ?? false;
      _uname = argv?.username ?? myPrefs.getString('uname');
      _passwd = argv?.password ?? myPrefs.getString('passwd');
    });
  }

  @override
  Widget build(BuildContext context) {
    argv = ModalRoute.of(context)!.settings.arguments as WelcomePage?;
    // if (_remember!) {
    //   setState(() {
    //     _uname = argv!.username;
    //     _passwd = argv.password;
    //   });
    // }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            children: [
              Text(
                'Welcom $_uname',
                style: const TextStyle(fontSize: 24.0),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Your Password is : $_passwd',
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () async {
                  SharedPreferences myPrefs =
                      await SharedPreferences.getInstance();
                  myPrefs.setBool('remember', false);
                  myPrefs.setString('uname', '');
                  myPrefs.setString('passwd', '');
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
                child: const Text('Logout'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
