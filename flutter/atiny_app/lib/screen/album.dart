import 'package:flutter/material.dart';
import 'albumDetail.dart';
//import 'package:vegan_eats/theme.dart';

import '../model/albumModel.dart';

class AlbumListPage extends StatelessWidget {
  final AlbumHttp albumHttp = AlbumHttp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Albums',
          //style: heading,
        ),
      ),
      body: FutureBuilder(
        future: albumHttp.getAll(),
        builder: (context, AsyncSnapshot<List<Album>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child:  CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            final albums = snapshot.data!;
            return ListView.builder(
              itemCount: albums.length,
              itemBuilder: (context, index) {
                final album = albums[index];
                return ListTile(
                  leading: Image.network(album.cover, width: 100, height: 100,),
                  title: Text(album.name),
                  trailing: const Icon(Icons.arrow_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AlbumDetailPage(album: album),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(
              child: Text('No albums found.'),
            );
          }
        },
      ),
    );
  }
}