import 'package:atiny_app/screen/album.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'concerts.dart';

// ignore: use_key_in_widget_constructors
class DeviceScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _DeviceScreenState createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  int _currentScreen = 0;

  final List<Widget> _screenList = [
    // ignore: prefer_const_constructors
    HomeScreen(),
    AlbumListPage(),
    ConcertsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  _screenList[_currentScreen],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentScreen,
        onTap: onTabTapped,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.album), label: "Albums"),
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: "Concerts"),
        ]
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentScreen = index;
    });
  }
}

