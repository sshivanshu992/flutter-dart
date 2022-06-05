import 'package:drawers_application/drawers/create_drawer.dart';
import 'package:drawers_application/widgets/flights.dart';
import 'package:flutter/material.dart';

class FlightFragment extends StatelessWidget {
  static const String routeName = '/flights';

  const FlightFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking App'),
      ),
      body: const FlightsWidgets(),
      drawer: const CreateDrawers(),
    );
  }
}
