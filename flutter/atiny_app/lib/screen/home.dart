///
///screen/home.dart
///
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          //style: heading,
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Image.network(
                  ""
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
