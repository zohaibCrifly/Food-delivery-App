import 'package:flutter/material.dart';
import 'package:food_ordering_system/screen/address_info.dart';
//import 'package:food_ordering_system/screen/global/globallocation.dart';
//import 'package:food_ordering_system/screen/widgets/adjust_location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
//import 'package:provider/provider.dart';

class Pin extends StatefulWidget {
  const Pin({Key? key}) : super(key: key);

  @override
  _PinState createState() => _PinState();
}

class _PinState extends State<Pin> {
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

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              // LocationPin(mapHeight: 510),
              SizedBox(
                height: 515,
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
                          currentPosition = LatLng(
                              newposition.latitude, newposition.longitude);

                          getAddress();
                        });
                      },
                    ),
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 50),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close)),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Confirm devlivery address',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width - 40,
                        child: Text(address)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFFFB6D3A),
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => AddressInfo(
                                  currentAddress: address,
                                  position: currentPosition,
                                )));
                      },
                      child: Text(
                        'Confirm Location',
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
