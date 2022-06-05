// step 3: create a service to extract the geo-location co-ordinates [ optional ]

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
