import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_projects/forms/user_register_form.dart';
import 'package:firebase_projects/models/user_remove.dart';
import 'package:firebase_projects/screens/update_user_data.dart';
import 'package:flutter/material.dart';

class GetUserInformation extends StatefulWidget {
  const GetUserInformation({Key? key}) : super(key: key);

  @override
  State<GetUserInformation> createState() => _GetUserInformationState();
}

class _GetUserInformationState extends State<GetUserInformation> {
  final Stream<QuerySnapshot> _userStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('Adding Record to Firebase DB'),
        title: const Text('Users Data From Firebase DB'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: ElevatedButton(
              onPressed: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterUserForm()));
              }),
              child: const Text('Add', style: TextStyle(fontSize: 20.0)),
            ),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _userStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Error while processing the request...');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final List userDocs = [];
          snapshot.data!.docs.map((document) {
            Map userDoc = document.data() as Map<String, dynamic>;
            userDocs.add(userDoc);
            userDoc['id'] = document.id;
          }).toList();

          return ListView(
            children: [
              Table(
                border: TableBorder.all(),
                columnWidths: const <int, TableColumnWidth>{
                  1: FixedColumnWidth(140)
                },
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(children: [
                    TableCell(
                      child: Container(
                        color: Colors.pinkAccent,
                        child: const Center(
                          child: Text(
                            'Username',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        color: Colors.pinkAccent,
                        child: const Center(
                          child: Text(
                            'Email Id',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        color: Colors.pinkAccent,
                        child: const Center(
                          child: Text(
                            'Action',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    )
                  ]),
                  for (var row = 0; row < userDocs.length; row++) ...{
                    TableRow(children: [
                      TableCell(
                        child: Center(
                          child: Text(userDocs[row]['userName'],
                              style: const TextStyle(fontSize: 18.0)),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Text(userDocs[row]['emailId'],
                              style: const TextStyle(fontSize: 18.0)),
                        ),
                      ),
                      TableCell(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UpdateUserDetails(
                                            id: userDocs[row]['id'])));
                              }),
                              icon: const Icon(Icons.edit)),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => {
                              userRemove(userDocs[row]['id']),
                            },
                          )
                        ],
                      ))
                    ]),
                  }
                ],
              )
            ],
          );
        },
      ),
    );
  }
}









// ------------------------------------------------------------------------------------------

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class GetUserInformation extends StatefulWidget {
//   const GetUserInformation({Key? key}) : super(key: key);

//   @override
//   State<GetUserInformation> createState() => _GetUserInformationState();
// }

// class _GetUserInformationState extends State<GetUserInformation> {
//   final Stream<QuerySnapshot> _userStream =
//       FirebaseFirestore.instance.collection('users').snapshots();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // title: const Text('Adding Record to Firebase DB'),
//         title: const Text('Users Data From Firebase DB'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _userStream,
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return const Text('Error while processing the request...');
//           }
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Text('Loading the data....');
//           }
//           return ListView(
//             children: snapshot.data!.docs.map(
//               (document) {
//                 Map<String, dynamic> data =
//                     document.data()! as Map<String, dynamic>;
//                 return ListTile(
//                   title: Text(data['userName']),
//                   subtitle: Text(data['emailId']),
//                 );
//               },
//             ).toList(),
//           );
//         },
//       ),
//     );
//   }
// }
