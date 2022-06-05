import 'package:flutter/material.dart';

import '../models/user_models.dart';

class UserIdProvider with ChangeNotifier {
  late String email;

  void userEmailIdForProvider(User user) {
    email = user.email.toString();
    // email ='${user.username.toString()} \n ${user.password.toString()} \n ${user.email.toString()} \n ${user.id.toString()} \n ${user.mobile.toString()}';
    notifyListeners();
  }

  String get userDataFromDatabase => email;
}
