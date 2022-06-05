import 'package:drawers_application/drawers/create_drawer.dart';
import 'package:drawers_application/widgets/hotels.dart';
import 'package:flutter/material.dart';

class HotelFragment extends StatelessWidget {
  static const String routeName = '/hotels';

  const HotelFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking App'),
      ),
      body: const HotelsWidgets(),
      drawer: const CreateDrawers(),
    );
  }
}
