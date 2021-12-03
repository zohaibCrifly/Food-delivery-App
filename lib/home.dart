import 'package:flutter/material.dart';
import 'package:food_ordering_system/screen/address_info.dart';
import 'package:food_ordering_system/screen/enable_notification.dart';
import 'package:food_ordering_system/screen/filter.dart';
import 'package:food_ordering_system/screen/main_menu.dart';
import 'package:food_ordering_system/screen/mobile_verification.dart';
import 'package:food_ordering_system/screen/orders.dart';
import 'package:food_ordering_system/screen/privacy_policy.dart';
import 'package:food_ordering_system/style/style.dart';
import 'package:food_ordering_system/screen/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // Define the default brightness and colors.
          //  brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          backgroundColor: Colors.grey,
          fontFamily: GoogleFonts.nunito().fontFamily,
          // Define the default font family.

          // Define the default `TextTheme`. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          hintColor: const Color(0xFF64748B),
          textTheme: const TextTheme(
            headline1: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w600),
            headline2: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
            headline3: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
            bodyText1: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
            bodyText2: TextStyle(color: Color(0xFF64748B), fontSize: 16),
            button: TextStyle(
                color: Color(0xFF5478E2),
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
        home: // OrderBook()
            //Filter()
            MainMenu()
        //HomeSceena()
        // EnableNotification()
        // AddressInfo(position: LatLng(0, 0), currentAddress: '')
        // MobileVerification()
        );
  }
}
