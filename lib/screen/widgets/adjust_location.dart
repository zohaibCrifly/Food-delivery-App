//import 'dart:html';

// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationPin extends StatefulWidget {
  const LocationPin({Key? key, required this.mapHeight}) : super(key: key);
  final double mapHeight;

  @override
  _LocationPinState createState() => _LocationPinState();
}

class _LocationPinState extends State<LocationPin> {
  double lat = 213239, lng = 328237;
  //late double lat, lng;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   a();
  // }

  // var getlocation;

  // Future a() async {
  //   setState(() {
  //     getlocation = Location().getLocation();
  //     lat = getlocation['latitude'];
  //     lng = getlocation['langitude'];
  //   });
  // }

  _currentlocation(controller) {
    Location().onLocationChanged.listen((event) {
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(event.latitude!, event.longitude!), zoom: 15)));
      lat = event.latitude!.toDouble();
      lng = event.longitude!.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(top: 50.0),
        //   child: Container(
        //     height: 50,
        //     color: Colors.white,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         Text(
        //           .toString() +
        //               'latitude' +
        //               lat.toString(),
        //           style: Theme.of(context).textTheme.bodyText2,
        //         ),
        //         Text(
        //           'longitude' + lng.toString(),
        //           style: Theme.of(context).textTheme.headline1,
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        SizedBox(
          height: widget.mapHeight,
          child: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(lat, lng), zoom: 15),
            // onMapCreated: _currentlocation,
            onCameraMove: _currentlocation,
            myLocationEnabled: false,
            zoomControlsEnabled: true,
            markers: {
              Marker(
                  draggable: true,
                  markerId: MarkerId('1'),
                  position: LatLng(lat, lng),
                  onDragEnd: (newposition) {
                    setState(() {
                      lat = newposition.latitude;
                      lng = newposition.longitude;
                    });
                  }),
            },
          ),
        ),
      ],
    );
  }
}
