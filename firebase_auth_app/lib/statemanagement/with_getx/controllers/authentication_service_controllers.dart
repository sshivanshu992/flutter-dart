import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_app/services/authentication_service.dart';
import 'package:get/get.dart';

class AuthenticationServiceController extends GetxController {
  UserAuthenticationService authService =
      UserAuthenticationService(FirebaseAuth.instance);

  Future<dynamic> registerUser(String emailAddress, String password) async {
    return await authService.signUp(email: emailAddress, password: password);
  }

  Future<bool> validateUser(String emailAddress, String password) async {
    return await authService.signIn(email: emailAddress, password: password);
  }

  void logout() {
    authService.userAuthenticationStatus == null ? '' : authService.signOut();
  }
}
