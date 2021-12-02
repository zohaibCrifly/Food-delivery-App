import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class GlobalLocation extends ChangeNotifier {
  LatLng currentPosition = LatLng(33.688592146671425, 73.04865280603227);
  String address = 'adsfs';

  getLocation(LatLng a) {
    currentPosition = LatLng(a.latitude, a.longitude);
    getAddress() async {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          currentPosition.latitude, currentPosition.longitude);
      Placemark place = placemarks.first;

      address =
          '${place.street} , ${place.name} ,${place.subLocality} , ${place.country}';
      addListener(() {});
    }
  }
}
