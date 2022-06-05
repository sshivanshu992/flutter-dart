import 'package:flight_app/models/airport_info.dart';
import 'package:flutter/material.dart';

class FlightSearchScreen extends StatefulWidget {
  const FlightSearchScreen({Key? key}) : super(key: key);

  @override
  State<FlightSearchScreen> createState() => _FlightSearchScreenState();
}

enum TripType { oneway, roundtrip, multicity }
Map<TripType, String> _tripTypes = {
  TripType.oneway: 'ONE WAY',
  TripType.roundtrip: 'ROUNDTRIP',
  TripType.multicity: 'MULTICITY',
};
TripType _selectedTrip = TripType.oneway;

class _FlightSearchScreenState extends State<FlightSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: RichText(
          text: const TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 32),
            children: [
              TextSpan(
                text: 'Kellton',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black54,
                  letterSpacing: 1.5,
                ),
              ),
              TextSpan(
                text: 'Flight',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 6),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_tripTypes.length, (index) {
                    return tripTypeSelector(_tripTypes.keys.elementAt(index));
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(color: Colors.white, height: 20),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.all(24)),
              ),
              onPressed: () {},
              child: buildAirportSelector(
                  AirportInfo('BOM', 'Mumbai',
                      'Chatrapati Shivaji Maharaj International Airport'),
                  Icons.flight_takeoff),
            ),
            const Divider(
              height: 5.0,
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                padding: MaterialStateProperty.all<EdgeInsets>(
                    const EdgeInsets.all(24)),
              ),
              onPressed: () {},
              child: buildAirportSelector(
                  AirportInfo('DEL', 'New Delhi',
                      'Indira Gandhi International Airport'),
                  Icons.flight_land),
            ),
            const Divider(
              height: 5.0,
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        )),
                    onPressed: () {},
                    child: buildDateSelector('DEPARTURE', DateTime.now()),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        )),
                    onPressed: () {},
                    child: buildDateSelector(
                        'RETURN', DateTime.now().add(const Duration(days: 10))),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 5.0,
            ),
            Row()
          ],
        ),
      ),
    );
  }

  Widget buildDateSelector(String title, DateTime dateTime) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, color: Colors.grey),
        ),
        Row(
          children: [
            Text(
              dateTime.day.toString().padLeft(2, '0'),
              style: const TextStyle(fontSize: 48, color: Colors.black),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'May 2022',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  'Saturday',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget buildAirportSelector(AirportInfo airportInfo, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 60,
              child: Text(
                airportInfo.airportCode,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.black54),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  airportInfo.airportShortName,
                  style: const TextStyle(fontSize: 24, color: Colors.black87),
                ),
                Text(
                  airportInfo.airportLongName,
                  style: const TextStyle(fontSize: 12, color: Colors.black87),
                )
              ],
            ),
          ],
        ),
        Icon(icon, color: Colors.black)
      ],
    );
  }

  Widget tripTypeSelector(TripType tripType) {
    var isSelected = _selectedTrip == tripType;
    return TextButton(
      onPressed: () {
        setState(() {
          _selectedTrip = tripType;
        });
      },
      // color : isSelected ? Colors.blue:Colors.transparent,
      child: Row(children: [
        if (isSelected)
          const Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
        Text(
          '${_tripTypes[tripType]}',
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        )
      ]),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          isSelected ? Colors.blue : Colors.transparent,
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.only(
          left: 4,
          right: 16,
        )),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
      ),
    );
  }
}
