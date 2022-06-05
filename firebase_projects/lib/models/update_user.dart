import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<void> userUpdate(id, userName, passwd, emailId) {
  return users
      .doc(id)
      .update({
        'userName': userName,
        'password': passwd,
        'emailId': emailId,
      })
      .then((value) =>
              true //Get.snackbar('Update', 'User Data Updated Successfully'),
          )
      .catchError((onError) =>
              false //Get.snackbar( 'Error', 'Error while updating the user data\n$onError'),
          );
}
