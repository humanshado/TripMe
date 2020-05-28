import 'package:flutter/material.dart';
import 'package:tripme/screens/explore.dart';
import 'package:tripme/screens/home.dart';
import 'package:tripme/screens/trips_history.dart';
import 'package:tripme/utils/constants.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _currentScreenIndex = 0;

  static final List<Widget> _screens = [
    Home(),
    Explore(),
    TripsHistory(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _currentScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trips Budget', style: TextStyle(color: Colors.amber[300])),
        backgroundColor: AppColors.violetColor,
      ),
      body: _screens[_currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentScreenIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.explore), title: Text('Explore')),
          BottomNavigationBarItem(icon: Icon(Icons.history), title: Text('Trips History')),
          //BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Search')),
        ],
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}