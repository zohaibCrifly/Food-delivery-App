//import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import "package:flutter/material.dart";

class GlobalLocation extends ChangeNotifier {
  LatLng _currentPosition = LatLng(33.688592146671425, 73.04865280603227);
  String address = 'adsfs';
  LatLng getCurrentPosition() => _currentPosition;
  String getAddress() => address;

  getLocation(var a) {
    _currentPosition = LatLng(a.latitude, a.longitude);
    //address = getCurrentAddress();
    notifyListeners();
  }

  // getCurrentAddress() async {
  //   List<Placemark> placemarks = await placemarkFromCoordinates(
  //       currentPosition.latitude, currentPosition.longitude);
  //   Placemark place = placemarks.first;

  //   return '${place.street} , ${place.name} ,${place.subLocality} , ${place.country}';
  // }
}
