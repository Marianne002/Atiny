import 'package:flutter/material.dart';
import 'lyric.dart';
import '../model/albumModel.dart';

class AlbumDetailPage extends StatelessWidget {
  final Album album;

  // ignore: use_key_in_widget_constructors
  const AlbumDetailPage({required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color.fromARGB(146, 244, 67, 54), Color.fromARGB(145, 255, 235, 59), const Color.fromARGB(220, 124, 77, 255), const Color.fromARGB(240, 0, 0, 0)],
                ),
              ),
              child:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Image.network(
                      album.cover,
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${album.name}',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Release Year: ${album.releaseYear}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Description: ${album.description}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const Divider( height: 20, thickness: 1, endIndent: 0, color: Colors.black,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Tracks:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: album.tracks.length,
              itemBuilder: (context, index) {
                final track = album.tracks[index];
                return ListTile(
                  title: Text(track.title),
                  trailing: const Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrackDetailPage(track: track),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
