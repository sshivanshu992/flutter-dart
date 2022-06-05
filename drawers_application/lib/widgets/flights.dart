import 'package:flutter/material.dart';

class FlightsWidgets extends StatelessWidget {
  const FlightsWidgets({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.amberAccent,
          child: const Center(
            child:  Text('Flights Page'),
          ),
        )
      ],
    );
  }
}