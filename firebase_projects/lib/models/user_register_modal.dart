import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterUser {
  final String userName;
  final String password;
  final String emailId;

  RegisterUser({
    required this.userName,
    required this.password,
    required this.emailId,
  });

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser() {
    return users
        .add({
          'userName': userName,
          'password': password,
          'emailId': emailId,
        })
        .then(
          (value) => print('User Added....'),
        )
        .catchError(
          (onError) => print('Failed to create a new user : $onError'),
        );
  }
}
