import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

import '../../../services/authentication_service.dart';

class AuthenticationServiceController extends GetxController {
  UserAuthenticationService authService =
      UserAuthenticationService(FirebaseAuth.instance);

  Future<dynamic> registerUser(String emailAddress, String password) async {
    return await authService.signUp(email: emailAddress, password: password);
  }

  Future<dynamic> validateUser(String emailAddress, String password) async {
    return await authService.signIn(email: emailAddress, password: password);
  }

  // @override
  // void onInit() {
  //   currentUserData;
  //   super.onInit()
  // }

  //if user in not't login than return null
  get currentUserData => authService.currentUserDatas;

  // currentUserData.obs;

  Future<void> updateUserFullName(String name) async{
    await authService.updateUserName(name);
    update();
  }

  Future<void> updateUserOldPassword(String name) async{
    await authService.updateUserPassword(name);
    update();
  }

  //for deleting the current user from the Firebase
  Future<void> deleteAccout() async {
    await currentUserData.delete();
  }

  void logout() {
    authService.userAuthenticationStatus == null ? '' : authService.signOut();
  }
}
