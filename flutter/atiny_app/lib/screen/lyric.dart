import 'package:flutter/material.dart';
import '../model/albumModel.dart';

class TrackDetailPage extends StatelessWidget {
  final Track track;

  // ignore: use_key_in_widget_constructors
  const TrackDetailPage({required this.track});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(track.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(40),
        children: [
          LyricsText(),
        ]
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Expanded LyricsText() => Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text( track.title, style: const TextStyle(fontSize: 40, ),),
        const SizedBox(height: 20),
        Text( track.lyrics, style: const TextStyle(fontSize: 20, ), textAlign: TextAlign.center,),
      ]
    ),
  );

  
}
