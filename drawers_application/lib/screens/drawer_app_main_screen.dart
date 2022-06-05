import 'package:drawers_application/fregments/cabs_fragment.dart';
import 'package:drawers_application/fregments/default_fragment.dart';
import 'package:drawers_application/fregments/flight_fragment.dart';
import 'package:drawers_application/fregments/hotels_fragment.dart';
import 'package:drawers_application/routes/page_routes.dart';
import 'package:flutter/material.dart';

class BookingDrawerApp extends StatelessWidget {
  const BookingDrawerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: PageRoutes.home,
      routes: {
        PageRoutes.home: (context) => const DefaultFragment(),
        PageRoutes.hotel: (context) => const HotelFragment(),
        PageRoutes.flight: (context) => const FlightFragment(),
        PageRoutes.cab: (context) => const CabsFragment()
      },
    );
  }
}
