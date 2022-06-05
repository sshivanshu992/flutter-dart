import 'package:bottom_navigation/widgets/cabs.dart';
import 'package:bottom_navigation/widgets/flights.dart';
import 'package:bottom_navigation/widgets/hotels.dart';
import 'package:flutter/material.dart';

class BookingBottomNavApp extends StatefulWidget {
  const BookingBottomNavApp({Key? key}) : super(key: key);

  @override
  State<BookingBottomNavApp> createState() => _BookingBottomNavAppState();
}

class _BookingBottomNavAppState extends State<BookingBottomNavApp> {
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedFontSize: 24,
        unselectedFontSize: 20,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.hotel_sharp), label: 'Hotel'),
          BottomNavigationBarItem(icon: Icon(Icons.flight), label: 'Flight'),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_car), label: 'Cabs'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
