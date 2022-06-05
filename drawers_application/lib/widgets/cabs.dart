import 'package:flutter/material.dart';

class CabsWidgets extends StatelessWidget {
  const CabsWidgets({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.brown,
          child: const Center(
            child:  Text('Cabs Page'),
          ),
        )
      ],
    );
  }
}