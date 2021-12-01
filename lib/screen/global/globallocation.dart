import 'package:flutter/cupertino.dart';

class GlobalLocation extends ChangeNotifier {
  double lat = 23423;
  double lng = 23423;

  double getLat() => lat;
  double getLng() => lng;
  void getLocation() {}
}
