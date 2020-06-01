import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:tripme/models/trip_model.dart';
import 'package:latlong/latlong.dart';
import 'package:tripme/screens/new_trip/dates.dart';
import 'package:tripme/utils/constants.dart';

class NewTripLocation extends StatelessWidget {
  final Trip trip;
  NewTripLocation({Key key, @required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _locationController = TextEditingController(text: trip.destinationLocation);

    void _showForm(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
          decoration: BoxDecoration(
            color: AppColors.plumColor,
          ),
          child: _buildLocationForm(_locationController, context),
        );
      });
    }

    return Scaffold(
       body: _buildMap(),
            floatingActionButton: _buildSpeedDial(context, _showForm),
    );
  }

  Widget _buildLocationForm(_locationController, context){
    return Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         Text('${trip.title}', style: TextStyle(color: AppColors.culturedColor)),
         SizedBox(height: 25.0),
         Text("Enter the city you are visiting", style: TextStyle(color: AppColors.culturedColor, fontSize: 20,fontWeight: FontWeight.bold),),
         SizedBox(height: 15),
         Icon(Icons.location_city, size: 50, color: Colors.amber[800],),
         Padding(
           padding: const EdgeInsets.all(30.0),
           child: TextField(
             controller: _locationController,
             style: TextStyle(fontSize: 20.0, color: AppColors.culturedColor),
             autofocus: true,
             textAlign: TextAlign.center,
           ),
         ),
         Column(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: <Widget>[
             OutlineButton(
              borderSide: BorderSide(color: AppColors.culturedColor),
               child: Text('Save', style: TextStyle(fontSize: 15.0, color: AppColors.culturedColor,fontWeight: FontWeight.bold),),
              onPressed: (){
                trip.destinationLocation = _locationController.text;
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20.0),
            OutlineButton(
              borderSide: BorderSide(color: AppColors.culturedColor),
              child: Text('Cancel', style: TextStyle(color: Colors.amber[800], fontSize: 15.0,fontWeight: FontWeight.bold),),
              onPressed: (){
                Navigator.popUntil(context, ModalRoute.withName('/'));
              }
        ),
           ],
         ),
       ],
     );
  }

  Widget _buildSpeedDial(context, void _showForm()) {
    return SpeedDial(
       backgroundColor: Colors.blue[800],
       foregroundColor: Colors.white,
       overlayColor: Colors.green[100],
       overlayOpacity: 0.4,
       elevation: 8.0,
       child: Icon(Icons.menu),
       animatedIcon: AnimatedIcons.menu_close,
       curve: Curves.bounceOut,
       closeManually: true,
       onOpen: () => print('opening menu'),
       onClose: () => print('closing menu'),
       children: [
         SpeedDialChild(
           child: Icon(Icons.business),
           backgroundColor: AppColors.plumColor,
           foregroundColor: Colors.white,
           label: 'add city',
           onTap: () => _showForm(),
         ),
         SpeedDialChild(
           child: Icon(Icons.close),
           backgroundColor: Colors.red[800],
           foregroundColor: Colors.white,
           label: 'cancel',
           onTap: (){
             Navigator.popUntil(context, ModalRoute.withName('/'));
           },
         ),
         SpeedDialChild(
           child: Icon(Icons.arrow_back),
           backgroundColor: AppColors.violetColor,
           foregroundColor: Colors.white,
           label: 'go back',
           onTap: (){
             Navigator.of(context).pop();
           },
         ),
         SpeedDialChild(
           child: Icon(Icons.arrow_forward),
           backgroundColor: Colors.green,
           foregroundColor: Colors.white,
           label: 'next',
           onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => NewTripDates(trip: trip,))
            );
           },
         ),
       ],
    );
  }

  Widget _buildMap() {
    return FlutterMap(
       options: MapOptions(
         center: LatLng(40.71, -74.00),
         zoom: 13.0,
       ),
       layers: [
         TileLayerOptions(
           urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
           subdomains: ['a', 'b', 'c']
         ),
         MarkerLayerOptions(
           markers: [
             Marker(
               width: 80.0,
               height: 80.0,
               point: LatLng(40.71, -74.00),
               builder: (context) => Container(
                 child: IconButton(
                   icon: Icon(Icons.location_on),
                   color: Colors.blue[800],
                   iconSize: 65.0,
                   onPressed: (){},
                 ),
               ),
             ),
           ],
         ),
       ],
     );
  }
}