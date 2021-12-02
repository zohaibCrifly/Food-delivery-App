//import 'dart:html';

// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';

class LocationPin extends StatefulWidget {
  const LocationPin({Key? key, required this.mapHeight}) : super(key: key);
  final double mapHeight;

  @override
  _LocationPinState createState() => _LocationPinState();
}

class _LocationPinState extends State<LocationPin> {
  // double lat = 33.688592146671425, lng = 73.04865280603227;
  LatLng currentPosition = LatLng(33.688592146671425, 73.04865280603227);
  String address = "ABC road, Texas 912322";
  LatLng a = LatLng(33.688592146671425, 73.04865280603227);
  getAddress() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        currentPosition.latitude, currentPosition.longitude);
    Placemark place = placemarks.first;

    address =
        '${place.street} , ${place.name} ,${place.subLocality} , ${place.country}';
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.mapHeight,
          child: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: currentPosition, zoom: 15),
            // onMapCreated: _currentlocation,
            onCameraMove: (position) {
              currentPosition = position.target;
            },
            // myLocationEnabled: true,
            zoomControlsEnabled: true,
            markers: {
              Marker(
                draggable: true,
                markerId: MarkerId('1'),
                position: currentPosition,
                onDragEnd: (newposition) {
                  setState(() {
                    currentPosition =
                        LatLng(newposition.latitude, newposition.longitude);

                    getAddress();
                  });
                },
              ),
            },
          ),
        ),
        Text(address),
      ],
    );
  }
}
