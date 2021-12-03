import 'package:flutter/material.dart';
import 'package:food_ordering_system/screen/browser.dart';
import 'package:food_ordering_system/screen/home_screen.dart';
import 'package:food_ordering_system/screen/orders.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  List page = [
    HomeSceena(),
    Browser(),
    OrderBook(),
    Center(
      child: Text(
        'Account',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    )
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (c) {
          setState(() {
            selectedIndex = c;
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Color(0xFF808080),
        showUnselectedLabels: true,
        selectedFontSize: 16,
        unselectedFontSize: 16,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_search), label: 'Browser'),
          BottomNavigationBarItem(
              icon: Icon(Icons.event_note_outlined), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account')
        ],
      ),
      body: page.elementAt(selectedIndex),
    );
  }
}
