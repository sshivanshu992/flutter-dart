import 'package:cloud_firestore/cloud_firestore.dart';
CollectionReference users = FirebaseFirestore.instance.collection('users');
Future<void> userRemove(id) {
  print('Removing User with the $id');
  return users
      .doc(id)
      .delete()
      .then((value) => true //Get.snackbar('Delete', 'User Deleted with $id'),
          )
      .catchError((onError) =>
              false //Get.snackbar('Error', 'Error while removing the user\n$onError'),
          );
}
