import 'package:bottom_navigation/widgets/cabs.dart';
import 'package:bottom_navigation/widgets/flights.dart';
import 'package:bottom_navigation/widgets/hotels.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class FancyBottomNavApp extends StatefulWidget {
  const FancyBottomNavApp({Key? key}) : super(key: key);

  @override
  State<FancyBottomNavApp> createState() => _FancyBottomNavAppState();
}

class _FancyBottomNavAppState extends State<FancyBottomNavApp> {
  static int _currentIndex = 0;
  final tab_widgets = [
    const HotelsWidgets(),
    const FlightsWidgets(),
    const CabsWidgets()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Booking App'),
        ),
        body: tab_widgets[_currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.blueGrey,
          height: 50,
          backgroundColor: Colors.pinkAccent,
          buttonBackgroundColor: Colors.white,
          items: const [
            Icon(Icons.hotel, size: 30),
            Icon(Icons.flight, size: 30),
            Icon(
              Icons.directions_car,
              size: 30,
              color: Colors.redAccent,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
