import 'package:flutter/material.dart';

class HotelsWidgets extends StatelessWidget {
  const HotelsWidgets({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.lightBlueAccent,
          child: const Center(
            child:  Text('Hotels Page'),
          ),
        )
      ],
    );
  }
}