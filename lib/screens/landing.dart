import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripme/models/trip_model.dart';
import 'package:tripme/providers/navigation_provider.dart';
import 'package:tripme/screens/explore.dart';
import 'package:tripme/screens/home.dart';
import 'package:tripme/screens/new_trip/title.dart';
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

  @override
  Widget build(BuildContext context) {
    Trip trip = Trip();
    NavigationProvider navProvider = Provider.of<NavigationProvider>(context);

    _navigateAndReturnToOrigin(context, trip) async {
      navProvider.originIndex = _currentScreenIndex;
      await Navigator.push(context, MaterialPageRoute(
            builder: (context) => NewTripTitle(trip: trip))
      );
       _currentScreenIndex = navProvider.originIndex;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Trips Budget', style: TextStyle(color: Colors.amber[300])),
        backgroundColor: AppColors.violetColor,
        actions: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("new trip", style: TextStyle(fontSize: 15, color: Colors.amber[800]),),
              IconButton(
                color: Colors.amber[800],
                iconSize: 40,
                icon: Icon(Icons.business_center),
                onPressed: (){_navigateAndReturnToOrigin(context, trip);},
              ),
            ],
          ),
        ],
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
        onTap: (int index){
          setState(() => _currentScreenIndex = index);
        },
      ),
    );
  }
}