import 'package:bottom_navigation/widgets/cabs.dart';
import 'package:bottom_navigation/widgets/flights.dart';
import 'package:bottom_navigation/widgets/hotels.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
// import 'package:bottom_navy_bar/bottom_navy_bar.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class NewFancyBottomNavApp extends StatefulWidget {
  const NewFancyBottomNavApp({Key? key}) : super(key: key);

  @override
  State<NewFancyBottomNavApp> createState() => _NewFancyBottomNavAppState();
}

class _NewFancyBottomNavAppState extends State<NewFancyBottomNavApp> {
  static int _currentIndex = 0;
  final tabwidgets = [
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
      body: tabwidgets[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
        }),
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.hotel),
            title: const Text('Hotel'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
              icon: const Icon(Icons.flight),
              title: const Text('Flight'),
              activeColor: Colors.purpleAccent),
          BottomNavyBarItem(
              icon: const Icon(Icons.directions_car),
              title: const Text('Cab'),
              activeColor: Colors.pink),
        ],
      ),
    );
  }
}
