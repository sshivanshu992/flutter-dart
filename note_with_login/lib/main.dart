import 'package:flutter/material.dart';
import 'package:note_with_login/providers/providder_file.dart';
import 'package:note_with_login/screens/login_screen.dart';
import 'package:note_with_login/screens/sign_up_screen.dart';
import 'package:note_with_login/screens/succes.dart';
import 'package:provider/provider.dart';

class NoteApplication extends StatelessWidget {
  const NoteApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SignUpScreen.routeName,
      routes: {
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        LoginScreen.routeName: ((context) => const LoginScreen()),
        Success.routeName: ((context) => const Success()),
      },
    );
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserIdProvider()),
      ],
      child: const NoteApplication(),
    ),
  );
}



// void main() {
//   runApp(
//     MaterialApp(
//       initialRoute: SignUpScreen.routeName,
//       routes: {
//         SignUpScreen.routeName: (context) => const SignUpScreen(),
//         LoginScreen.routeName: ((context) => const LoginScreen()),
//         Success.routeName: ((context) => const Success()),
//       },
//     ),
//   );
// }
