import 'package:flutter/material.dart';
import 'package:tripme/models/trip_model.dart';
import 'package:tripme/screens/new_trip/description.dart';
import 'package:tripme/utils/constants.dart';

class NewTripTitle extends StatelessWidget {
  final Trip trip;
  final int originIndex;
  NewTripTitle({Key key, @required this.trip, this.originIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = TextEditingController(text: trip.title);

    return Scaffold(
       appBar: AppBar(
         title: Text('Create a Trip', style: TextStyle(color: AppColors.violetColor, fontWeight: FontWeight.bold),),
         backgroundColor: Colors.amber[800],
       ),
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Text('Give the trip a title', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
           SizedBox(height: 15),
           Icon(Icons.public, size: 50,),
           Padding(
             padding: const EdgeInsets.fromLTRB(40.0, 60.0, 40.0, 40.0),
             child: TextField(
               controller: _titleController,
               style: TextStyle(fontSize: 20.0),
               autofocus: true,
             ),
           ),
           Column(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[
               RaisedButton(
                 color: Colors.green,
                 child: Text('next', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                onPressed: (){
                  trip.title = _titleController.text;
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => NewTripDescription(trip: trip,))
                  );
                },
              ),
              SizedBox(height: 20.0),
              OutlineButton(
                borderSide: BorderSide(color: Colors.red),
                child: Text('Cancel', style: TextStyle(color: Colors.red, fontSize: 15.0,fontWeight: FontWeight.bold),),
                onPressed: (){
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                }
          ),
             ],
           ),
         ],
       ),
    );
  }
}