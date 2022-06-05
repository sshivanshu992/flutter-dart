import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_projects/models/update_user.dart';
import 'package:flutter/material.dart';

class UpdateUserDetails extends StatefulWidget {
  final String id;
  const UpdateUserDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<UpdateUserDetails> createState() => _UpdateUserDetailsState();
}

class _UpdateUserDetailsState extends State<UpdateUserDetails> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update User Data'),
      ),
      body: Form(
        key: _formKey,
        child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: FirebaseFirestore.instance
              .collection('users')
              .doc(widget.id)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              //  Get.snackbar('Error', 'Unkown Exception Raised');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            var data = snapshot.data!.data();
            var userName = data!['userName'];
            var password = data['password'];
            var emailId = data['emailId'];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            initialValue: userName,
                            onChanged: (value) => userName = value,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                labelText: 'Enter Username'),
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
                            initialValue: emailId,
                            onChanged: (value) => emailId = value,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                labelText: 'Enter Email Id'),
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
                            initialValue: password,
                            onChanged: (value) => password = value,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                                labelText: 'Enter Password'),
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
                                userUpdate(
                                    widget.id, userName, password, emailId);
                                Navigator.pop(context);
                              }
                            }),
                            child: const Text('Update'),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
