import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_projects/firebase_options.dart';
// import 'package:firebase_projects/forms/user_register_form.dart';
import 'package:firebase_projects/screens/get_user_data.dart';
// import 'package:firebase_projects/screens/get_user_data.dart';
import 'package:flutter/material.dart';

// import 'models/add_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyfireBaseForm());
}

class MyfireBaseForm extends StatelessWidget {
  const MyfireBaseForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GetUserInformation(),
    );
  }
}


// class MyfireBaseCode extends StatelessWidget {
//   const MyfireBaseCode({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           // title: const Text('Adding Record to Firebase DB'),
//           title: const Text('Users Data From Firebase DB'),
//         ),
//         body: const GetUserInformation(),
//       ),

//       //   body: const AddUser(
//       //       userName: 'cwancu',
//       //       password: '123dsawe',
//       //       emailId: 'shivancu@gmail.com'),
//       // ),
//     );
//   }
// }
