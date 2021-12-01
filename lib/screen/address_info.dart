import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_ordering_system/screen/adjust_pin.dart';
import 'package:food_ordering_system/screen/widgets/adjust_location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressInfo extends StatefulWidget {
  const AddressInfo({Key? key}) : super(key: key);

  @override
  _AddressInfoState createState() => _AddressInfoState();
}

class _AddressInfoState extends State<AddressInfo> {
  List<Map> deliveryOptions = [
    {'icon': Icons.door_back_door_rounded, 'title': 'Leave at door'},
    {'icon': Icons.person, 'title': 'Meet at door'},
    {'icon': Icons.car_repair, 'title': 'Meet at Shop'},
  ];

  // final LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  // late GoogleMapController _controller;
  // final Location _location = Location();

  // void _onMapCreated(GoogleMapController _cntlr) {
  //   _controller = _cntlr;
  //   _location.onLocationChanged.listen((l) {
  //     _controller.animateCamera(
  //       CameraUpdate.newCameraPosition(
  //         CameraPosition(
  //             target:
  //                 LatLng((l.latitude)!.toDouble(), (l.longitude)!.toDouble()),
  //             zoom: 15),
  //       ),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFFB6D3A),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                        Text(
                          'Address Info',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        SizedBox(
                          width: 30,
                        )
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                          height: 170,
                          child: LocationPin(
                            mapHeight: 170,
                          )
                          // GoogleMap(
                          //   initialCameraPosition:
                          //       CameraPosition(target: _initialcameraposition),
                          //   mapType: MapType.normal,
                          //   onMapCreated: _onMapCreated,
                          //   myLocationEnabled: false,
                          //   zoomControlsEnabled: false,
                          // ),
                          ),
                      // Image.asset(
                      //   'images/map.png',
                      //   width: MediaQuery.of(context).size.width,
                      //   height: 180,
                      //   fit: BoxFit.cover,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                primary: Color(0xFFFFFFFF),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => Pin()));
                            },
                            child: Text(
                              'Adjust pin',
                              style: TextStyle(color: Color(0xFF000000)),
                            )),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'ABC road, Texas 912322',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 15),
                              hintText: 'Flat/ Suite/ Floor',
                              fillColor: Color(0xFFF2F2F2),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: BorderSide.none)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 15),
                              hintText: 'Business or building name',
                              fillColor: Color(0xFFF2F2F2),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: BorderSide.none)),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Color(0xFFF2F2F2),
                    height: 10,
                    thickness: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Delivery options',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int i = 0; i < deliveryOptions.length; i++)
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(

                                        // padding: EdgeInsets.symmetric(
                                        //     vertical: 10, horizontal: 20),
                                        primary: Color(0xFFF2F2F2),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50))),
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Icon(
                                          deliveryOptions[i]['icon'],
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          deliveryOptions[i]['title'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              // fontWeight: FontWeight.normal,
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Color(0xFFF2F2F2),
                    height: 10,
                    thickness: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Address label',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 15),
                              hintText: 'Add a label (e.g. school)',
                              fillColor: Color(0xFFF2F2F2),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: BorderSide.none),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(13),
                                  borderSide: BorderSide.none)),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Color(0xFFF2F2F2),
                    height: 20,
                    thickness: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFFF2F2F2),
                            padding: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {},
                        child: Text(
                          'Save and continue',
                          style: TextStyle(color: Color(0xFF64748B)),
                        )),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
