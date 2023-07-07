import 'package:atiny_app/screen/device.dart';
import 'package:flutter/material.dart';


void main() {
  runApp( MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}


/// la classe de l'état principal de l'app
class _MyAppState extends State<MyApp> {
  //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Atiny",
      theme: ThemeData(
        fontFamily: 'Handlee',
        primarySwatch: Colors.deepPurple,
        //brightness: Brightness.dark,
        //scaffoldBackgroundColor: Color.fromARGB(255, 178, 160, 208)
      ), 
      home: DeviceScreen(),
      //
    );
  }
}