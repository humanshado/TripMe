import 'package:flutter/material.dart';
import 'package:tripme/models/trip_model.dart';

class NewTripBudget extends StatelessWidget {
  final Trip trip;
  NewTripBudget({Key key, @required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _budgetController = TextEditingController();

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
               controller: _budgetController,
               style: TextStyle(fontSize: 20.0),
               autofocus: true,
               textAlign: TextAlign.center,
             ),
           ),
           Column(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: <Widget>[
               RaisedButton(
                 color: Colors.grey[600],
                 child: Text('next', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                onPressed: (){
                  // trip.description = _budgetController.text;
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) => NewTripLocation(trip: trip,))
                  // );
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