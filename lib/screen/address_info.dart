import 'package:flutter/material.dart';
import 'package:food_ordering_system/screen/adjust_pin.dart';
import 'package:food_ordering_system/screen/enable_notification.dart';
import 'package:food_ordering_system/screen/widgets/animatepage_route.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressInfo extends StatefulWidget {
  final String currentAddress;
  final LatLng position;
  const AddressInfo(
      {Key? key, required this.currentAddress, required this.position})
      : super(key: key);

  @override
  _AddressInfoState createState() => _AddressInfoState();
}

class _AddressInfoState extends State<AddressInfo> {
  List<Map> deliveryOptions = [
    {
      'icon': Icons.door_back_door_rounded,
      'title': 'Leave at door',
      'selected': true,
    },
    {
      'icon': Icons.person,
      'title': 'Meet at door',
      'selected': false,
    },
    {
      'icon': Icons.car_repair,
      'title': 'Meet at Shop',
      'selected': false,
    },
  ];
  bool flateFloor = false;
  bool business = false;
  bool onNext = false;
  bool addressLable = false;

  String getAddress() {
    if (widget.currentAddress == '') {
      return 'ABC road, Texas 912322';
    } else {
      return widget.currentAddress;
    }
  }

  LatLng getPosition() {
    if (widget.position == LatLng(0, 0)) {
      return LatLng(33.688592146671425, 73.04865280603227);
    } else {
      return widget.position;
    }
  }

  selectOption(a) {
    setState(() {
      for (int j = 0; j < deliveryOptions.length; j++) {
        if (j == a) {
          deliveryOptions[j]['selected'] = true;
        } else {
          deliveryOptions[j]['selected'] = false;
        }
      }

      //   for (int i = 0; i < deliveryOptions.length; i++) {
      //     if (a == i) {
      //       deliveryOptions[i]['selected'] == true;
      //     } else {
      //       deliveryOptions[i]['selected'] == false;
      //     }
      //   }
    });
  }

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
                        child: GoogleMap(
                          initialCameraPosition:
                              CameraPosition(target: getPosition(), zoom: 15),
                          // onCameraMove: (position) {
                          //   position.target;
                          // },
                          // zoomControlsEnabled: true,
                          markers: {
                            Marker(
                              draggable: true,
                              markerId: MarkerId('1'),
                              position: getPosition(),
                            ),
                          },
                        ),
                      ),
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
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 40,
                              child: Text(
                                getAddress(),
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              if (value == '') {
                                flateFloor = true;
                                onNext = false;
                              } else {
                                flateFloor = false;
                                if (!flateFloor && !business && !addressLable) {
                                  onNext = true;
                                }
                              }
                            });
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 15),
                              errorText:
                                  flateFloor ? 'Enter Flate/Suite/Floor' : null,
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
                          onChanged: (value) {
                            setState(() {
                              if (value == '') {
                                business = true;
                                onNext = false;
                              } else {
                                business = false;
                                if (!flateFloor && !business && !addressLable) {
                                  onNext = true;
                                }
                              }
                            });
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 15),
                              errorText: business
                                  ? 'Enter Business or bulding name'
                                  : null,
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
                                    onPressed: () {
                                      selectOption(i);
                                    },
                                    style: ElevatedButton.styleFrom(

                                        // padding: EdgeInsets.symmetric(
                                        //     vertical: 10, horizontal: 20),
                                        primary: deliveryOptions[i]['selected']
                                            ? Color(0xFFFB6D3A)
                                            : Color(0xFFF2F2F2),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50))),
                                    child: Row(
                                      children: [
                                        Icon(
                                          deliveryOptions[i]['icon'],
                                          color: deliveryOptions[i]['selected']
                                              ? Colors.white
                                              : Colors.black,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          deliveryOptions[i]['title'],
                                          style: TextStyle(
                                              color: deliveryOptions[i]
                                                      ['selected']
                                                  ? Colors.white
                                                  : Colors.black,
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
                          onChanged: (valuea) {
                            setState(() {
                              if (valuea == '') {
                                addressLable = true;
                                onNext = false;
                              } else {
                                addressLable = false;
                                if (!flateFloor && !business && !addressLable) {
                                  onNext = true;
                                }
                              }
                            });
                          },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 15),
                              errorText: addressLable
                                  ? 'Enter the address label'
                                  : null,
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
                            primary:
                                onNext ? Color(0xFFFB6D3A) : Color(0xFFF2F2F2),
                            padding: EdgeInsets.all(15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {
                          onNext
                              ? Navigator.of(context).push(AnimateRoute(
                                  page: const EnableNotification()))
                              : null;
                        },
                        child: Text(
                          'Save and continue',
                          style: TextStyle(
                              color: onNext ? Colors.white : Color(0xFF64748B)),
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
