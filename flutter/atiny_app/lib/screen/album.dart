import 'package:atiny_app/screen/tracks.dart';
import 'package:flutter/material.dart';
import '../model/trackModel.dart';


class AlbumListScreen extends StatelessWidget {
  final AlbumHttp albumHttp = AlbumHttp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: albumHttp.getAlbums(),
        builder: (context, AsyncSnapshot<List<Albums>> snapshot) {
          if (snapshot.hasData) {
            final List<Albums> albums = snapshot.data!;
            return ListView.builder(
              itemCount: albums.length,
              itemBuilder: (context, index) {
                final Albums album = albums[index];
                return ListTile(
                  title: Text(album.name as String),
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrackListScreen(album: album),
                        ),
                      );
                    },  
                  
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
      ),
    );
  }
}