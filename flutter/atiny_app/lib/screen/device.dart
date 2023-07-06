///
//screen/device.dart
///
import 'package:atiny_app/screen/album.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'tracks.dart';
import 'concerts.dart';

class DeviceScreen extends StatefulWidget {
  @override
  _DeviceScreenState createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  int _currentScreen = 0;

  final List<Widget> _screenList = [
    HomeScreen(),
    AlbumListScreen(),
    ConcertsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Atiny"),
      ),
      body:  _screenList[_currentScreen],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentScreen,
        onTap: onTabTapped,
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.album), label: "Tracks"),
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

