import 'package:flutter/material.dart';
import 'package:tripme/models/trip_model.dart';

class Home extends StatelessWidget {
  final List<Trip> tripsList = [
    Trip(title: "Weekend Gateway to Montreal", startDate: DateTime.now(), endDate: DateTime.now().add(Duration(days: 14)), budget: 150.0, travelMode: "Car"),
    Trip(title: "Family Visit to Zaria", startDate: DateTime.now(), endDate: DateTime.now().add(Duration(days: 21)), budget: 400.0, travelMode: "Flight"),
    Trip(title: "Honeymoon in Maldives", startDate: DateTime.now(), endDate: DateTime.now().add(Duration(days: 30)), budget: 880.0, travelMode: "Flight"),
    Trip(title: "Project Meeting in Amsterdam", startDate: DateTime.now(), endDate: DateTime.now().add(Duration(days: 5)), budget: 230.0, travelMode: "Train"),
    Trip(title: "Climate Change Conference in Kyoto", startDate: DateTime.now(), endDate: DateTime.now().add(Duration(days: 8)), budget: 370.0, travelMode: "Flight"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: tripsList.length,
        itemBuilder: (context, int index) => _buildTripCard(context, index),
        ),
    );
  }

  Widget _buildTripCard(context, index){
    final trip = tripsList[index];
    return Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
                  Text(trip.title, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                  SizedBox(height: 12.0),
                  Text(trip.startDate.toIso8601String().toString()),
                  Text(trip.endDate.toIso8601String().toString()),
                  Text(trip.budget.toString()),
                  Text(trip.travelMode),
                ],
              ),
            ),
          ),
        ),
    );
  }

}