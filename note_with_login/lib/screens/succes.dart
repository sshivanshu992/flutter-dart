import 'package:flutter/material.dart';
import 'package:note_with_login/providers/providder_file.dart';
import 'package:provider/provider.dart';

class Success extends StatefulWidget {
  static const String routeName = '/success';
  const Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Done'),
      ),
      body: ListView(children: [
        Center(
          child: Text(
              context.watch<UserIdProvider>().userDataFromDatabase.toString()),
        )
      ]),
    );
  }
}
