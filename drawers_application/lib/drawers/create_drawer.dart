import 'package:drawers_application/fregments/cabs_fragment.dart';
import 'package:drawers_application/fregments/flight_fragment.dart';
import 'package:drawers_application/fregments/hotels_fragment.dart';
import 'package:flutter/material.dart';

class CreateDrawers extends StatelessWidget {
  const CreateDrawers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Center(
              child: Text(
                'Booking APP',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.lightBlueAccent, Colors.blueAccent],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.hotel),
            title: const Text('Hotel Booking'),
            onTap: () {
              Navigator.of(context).pushNamed(HotelFragment.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.flight),
            title: const Text('Flight Bookings'),
            onTap: () {
              Navigator.of(context).pushNamed(FlightFragment.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_car),
            title: const Text('Cab Booking'),
            onTap: () {
              Navigator.of(context).pushNamed(CabsFragment.routeName);
            },
          )
        ],
      ),
    );
  }
}
