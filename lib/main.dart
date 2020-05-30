import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tripme/providers/navigation_provider.dart';
import 'package:tripme/screens/landing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => NavigationProvider(),
        child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Landing(),
      ),
    );
  }
}

