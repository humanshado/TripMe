import 'package:flutter/material.dart';
import 'package:tripme/models/trip_model.dart';
import 'package:tripme/screens/new_trip/budget.dart';
import 'package:tripme/utils/constants.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;
import 'package:intl/intl.dart';


class NewTripDates extends StatefulWidget {
  final Trip trip;
  NewTripDates({Key key, @required this.trip}) : super(key: key);

  @override
  _NewTripDatesState createState() => _NewTripDatesState();
}

class _NewTripDatesState extends State<NewTripDates> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 7));

  Future displayDatePicker(context) async {
    final List<DateTime> picked = await DateRangePicker.showDatePicker(
          context: context,
          initialFirstDate: _startDate,
          initialLastDate: _endDate,
          firstDate: DateTime(DateTime.now().year - 50),
          lastDate: DateTime(DateTime.now().year + 100)
      );
      if (picked != null && picked.length == 2) {
        print(picked);
        setState(() {
          _startDate = picked[0];
          _endDate = picked[1];
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Create a Trip'),
         backgroundColor: AppColors.oliveColor,
       ),
       body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${widget.trip.title}'),
            Text('${widget.trip.destinationLocation}'),
            SizedBox(height: 25.0),
            Text('Click to Pick your dates', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 15),
            IconButton(
              icon: Icon(Icons.add_circle_outline, size: 50,),
              onPressed: () async {
                await displayDatePicker(context);
              },
           ),
            SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('Start Date'),
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(10.0, 5.0), blurRadius: 3.0, spreadRadius: 3.0)],
                      ),
                      child: Column(
                        children:<Widget>[
                          Text(
                            '${DateFormat('dd').format(_startDate)}',
                            style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold)),
                          Text(
                            '${DateFormat('MMM yy').format(_startDate)}',
                            style: TextStyle(fontSize: 30.0, color: AppColors.grulloColor, fontWeight: FontWeight.bold))
                        ]
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text('End Date'),
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(10.0, 5.0), blurRadius: 3.0, spreadRadius: 3.0)],
                      ),
                      child: Column(
                        children:<Widget>[
                          Text(
                            '${DateFormat('dd').format(_endDate)}',
                            style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold)),
                          Text(
                            '${DateFormat('MMM yy').format(_endDate)}',
                            style: TextStyle(fontSize: 30.0, color: AppColors.grulloColor, fontWeight: FontWeight.bold))
                        ]
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 45.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  color: AppColors.oliveColor,
                  child: Text('next', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                 onPressed: (){
                   //trip.startDate = _startDate;
                   //trip.endDate = _endDate;
                   Navigator.push(context, MaterialPageRoute(
                     builder: (context) => NewTripBudget(trip: widget.trip,))
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
         ),
    );
  }
}