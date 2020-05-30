import 'package:flutter/material.dart';
import 'package:tripme/models/trip_model.dart';
import 'package:tripme/screens/new_trip/location.dart';

class NewTripDescription extends StatelessWidget {
  final Trip trip;
  NewTripDescription({Key key, @required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _descriptionController = TextEditingController(text: trip.description);

    return Scaffold(
       appBar: AppBar(
         title: Text('Create a Trip'),
       ),
       body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Text('${trip.title}'),
           SizedBox(height: 15.0),
           Text('How will you describe this trip?', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
           SizedBox(height: 15),
           Icon(Icons.book, size: 50,),
           Padding(
             padding: const EdgeInsets.all(30.0),
             child: TextField(
               maxLines: 5,
               maxLength: 145,
               controller: _descriptionController,
               style: TextStyle(fontSize: 20.0),
               decoration: InputDecoration(
                 fillColor: Colors.grey[100],
                 filled: true,

               ),
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
                  trip.description = _descriptionController.text;
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => NewTripLocation(trip: trip,))
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