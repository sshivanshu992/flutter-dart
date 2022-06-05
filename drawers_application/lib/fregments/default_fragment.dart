  import 'package:drawers_application/drawers/create_drawer.dart';
import 'package:flutter/material.dart';

class DefaultFragment extends StatelessWidget {
  static const String routeName = '/home';

  const DefaultFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking App'),
      ),
      body: Container(
        color: Colors.amberAccent,
        child: const Center(
          child: Text(
            'Booking Made Easy....',
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ),
      drawer: const CreateDrawers(),
    );
  }
}
