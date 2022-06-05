import 'package:flutter/material.dart';
import 'package:geo_location_app/screens/main_screens.dart';

class LocationApp extends StatelessWidget {
  const LocationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GeoLocationScreen(),
    );
  }
}

void main() {
  runApp(const LocationApp());
}
