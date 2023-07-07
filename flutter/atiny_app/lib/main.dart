import 'package:atiny_app/screen/device.dart';
import 'package:flutter/material.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
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