import 'package:flutter/material.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  TextEditingController unameController = TextEditingController();
  TextEditingController passwdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.login),
        title: const Text('Login App'),
      ),
      //Column
      body: Form(
        key: _formKey,
        child: ListView(children: [
          Image.network(
              'https://i.pinimg.com/originals/33/b8/69/33b869f90619e81763dbf1fccc896d8d.jpg'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: unameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'User name ',
                hintText: 'Enter user name',
                icon: const Icon(Icons.person),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Username can't be Blank";
                }
                return null;
              },
            ),
          ),

          ///this for password fields--------------------
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: true,
              controller: passwdController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter password',
                icon: const Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password can't be Blank";
                }
                return null;
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_formKey.currentState!.validate()) {
                      var uname = unameController.text;
                      var passwd = passwdController.text;
                      _message = 'User name : $uname\nPassword : $passwd';
                    }
                  });
                },
                child: const Text('Login'),
              ),
              const SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    unameController.text =
                        passwdController.text = _message = '';
                  });
                },
                child: const Text('Clear'),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Center(
            child: Text(
              _message,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
            ),
          )
        ]),
      ),
    );
  }
}



///



//-------------------------------------------------------------------------------
// class LoginApp extends StatefulWidget {
//   const LoginApp({Key? key}) : super(key: key);

//   @override
//   State<LoginApp> createState() => _LoginAppState();
// }

// class _LoginAppState extends State<LoginApp> {
//   TextEditingController unameController = TextEditingController();
//   TextEditingController passwdController = TextEditingController();
//   String _message = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const Icon(Icons.login),
//         title: const Text('Login App'),
//       ),
//       //Column
//       body: ListView(children: [
//         Image.network(
//             'https://i.pinimg.com/originals/33/b8/69/33b869f90619e81763dbf1fccc896d8d.jpg'),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextField(
//             controller: unameController,
//             keyboardType: TextInputType.text,
//             decoration: InputDecoration(
//               labelText: 'User name ',
//               hintText: 'Enter user name',
//               icon: const Icon(Icons.person),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(6.0),
//               ),
//             ),
//           ),
//         ),

//         ///this for password fields--------------------
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextField(
//             obscureText: true,
//             controller: passwdController,
//             keyboardType: TextInputType.text,
//             decoration: InputDecoration(
//               labelText: 'Password',
//               hintText: 'Enter password',
//               icon: const Icon(Icons.lock),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(6.0),
//               ),
//             ),
//           ),
//         ),

//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   var uname = unameController.text;
//                   var passwd = passwdController.text;
//                   _message = 'User name : $uname\nPassword : $passwd';
//                 });
//               },
//               child: const Text('Login'),
//             ),
//             const SizedBox(width: 20.0),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   unameController.text = passwdController.text = _message = '';
//                 });
//               },
//               child: const Text('Clear'),
//             ),
//           ],
//         ),
//         const SizedBox(height: 10.0),
//         Center(
//           child: Text(
//             _message,
//             textDirection: TextDirection.ltr,
//             textAlign: TextAlign.center,
//           ),
//         )
//       ]),
//     );
//   }
// }


// class LoginApp extends StatefulWidget {
//   const LoginApp({Key? key}) : super(key: key);

//   @override
//   State<LoginApp> createState() => _LoginAppState();
// }

// class _LoginAppState extends State<LoginApp> {
//   String _uname = '';
//   String _passwd = '';
//   String _message = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const Icon(Icons.login),
//         title: const Text('Login Form'),
//       ),
//       //Column
//       body: ListView(children: [
//         Image.network(
//             'https://i.pinimg.com/originals/33/b8/69/33b869f90619e81763dbf1fccc896d8d.jpg'),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextField(
//             keyboardType: TextInputType.text,
//             decoration: InputDecoration(
//               labelText: 'User name ',
//               hintText: 'Enter user name',
//               icon: const Icon(Icons.person),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(6.0),
//               ),
//             ),
//             onChanged: (value) => _uname = value,
//           ),
//         ),

//         ///this for password fields--------------------
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextField(
//             obscureText: true,
//             keyboardType: TextInputType.text,
//             decoration: InputDecoration(
//               labelText: 'Password',
//               hintText: 'Enter password',
//               icon: const Icon(Icons.lock),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(6.0),
//               ),
//             ),
//             onChanged: (value) => _passwd = value,
//           ),
//         ),

//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   _message = 'User name : $_uname\nPassword : $_passwd';
//                 });
//               },
//               child: const Text('Login'),
//             ),
//             const SizedBox(width: 20.0),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {});
//               },
//               child: const Text('Clear'),
//             ),
//           ],
//         ),
//         const SizedBox(height: 10.0),
//         Center(
//           child: Text(
//             _message,
//             textDirection: TextDirection.ltr,
//             textAlign: TextAlign.center,
//           ),
//         )
//       ]),
//     );
//   }
// }
