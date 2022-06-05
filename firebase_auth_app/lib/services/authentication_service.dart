import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserAuthenticationService {
  final FirebaseAuth _firebaseAuth;
  UserAuthenticationService(this._firebaseAuth);

  get userAuthenticationStatus => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  //for register the users
  Future<dynamic> signUp(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'true';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // print('The password provided is too weak.');

        return 'The password provided is too weak.';
        
      } else if (e.code == 'email-already-in-use') {
        // print('The account already exists for that email.');
        return 'The account already exists for that email.';
        
      }
      // return 'The password provided is too weak. After if else';
      // return false;
    } catch (e) {
      print(e);
      return '$e';
      // return false;
    }
  }

  Future<bool> signIn({required String email, required String password}) async {
    try {
      _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        // Get.snackbar('Error', 'No user found for that email');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    }
  }
}
