import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../statemanagement/with_getx/controllers/authentication_service_controllers.dart';
import 'login_screen.dart';

class UserDetailsFromFirebase extends StatefulWidget {
  const UserDetailsFromFirebase({Key? key}) : super(key: key);

  @override
  State<UserDetailsFromFirebase> createState() =>
      _UserDetailsFromFirebaseState();
}

class _UserDetailsFromFirebaseState extends State<UserDetailsFromFirebase> {
  AuthenticationServiceController controller =
      Get.put(AuthenticationServiceController());

  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${controller.currentUserData.displayName}'),
        actions: [
          ElevatedButton(
            onPressed: (() {
              controller.logout();
              Get.to(() => const SignInUserPage());
            }),
            child: const Text('Sign Out'),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Update your profile',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(labelText: 'full Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter full name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(labelText: 'Password'),
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
                    onPressed: (() async {
                      if (_formKey.currentState!.validate()) {
                        await controller
                            .updateUserFullName(nameController.text);
                        await controller
                            .updateUserOldPassword(passwordController.text);
                        print('Data Updated....');
                        //

                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) =>
                        //             super.widget));
                      }
                    }),
                    child: const Text('Update'),
                  ),
                  GetBuilder<AuthenticationServiceController>(
                    init: AuthenticationServiceController(),
                    builder: (_) => writeUserData(),
                  ),
                  Text(
                      'Your Current name : ${controller.currentUserData.displayName}'),
                  Text('Your Gmail : ${controller.currentUserData.email}'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget writeUserData() {
    return Text("Update Name : ${controller.currentUserData.displayName}");
  }
}
