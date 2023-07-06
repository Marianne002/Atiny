///
///screen/tracks.dart
///
import 'package:flutter/material.dart';
import '../model/trackModel.dart';





class TrackListScreen extends StatelessWidget {
  final Albums album;
  final AlbumHttp albumHttp = AlbumHttp();
  
  TrackListScreen({required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.name as String),
        
      ),
       
    );
  }
}
/**FutureBuilder(
        future: albumHttp.getTracks(album.id),
        builder: (context, AsyncSnapshot<List<Tracks>> snapshot) {
          if (snapshot.hasData) {
            final List<Tracks> tracks = snapshot.data!;
            return ListView.builder(
              itemCount: tracks.length,
              itemBuilder: (context, index) {
                final Tracks track = tracks[index];
                return ListTile(
                  title: Text(track.title as String),
                  // Add any other desired UI components for each track
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ), */
