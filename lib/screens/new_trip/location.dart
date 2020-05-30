import 'package:flutter/material.dart';
import 'package:tripme/models/trip_model.dart';

class NewTripLocation extends StatelessWidget {
  final Trip trip;
  NewTripLocation({Key key, @required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _locationController = TextEditingController(text: trip.title);

    return Scaffold(
       appBar: AppBar(
         title: Text('Create a Trip'),
       ),
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Text("Enter title of your trip"),
           Padding(
             padding: const EdgeInsets.all(40.0),
             child: TextField(),
           ),
         ],
       ),
    );
  }
}