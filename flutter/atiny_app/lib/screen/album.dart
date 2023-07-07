import 'package:flutter/material.dart';
import 'albumDetail.dart';
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
              child: CircularProgressIndicator(),
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
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AlbumDetailPage(album: album),
                      ),
                    );
                  },
                  child: 
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 40, bottom: 10, top:10),
                      child: Card(
                        child: Column(
                          children:[
                          SizedBox(height: 20),
                          Image.network(album.cover, width: 200, height: 200),
                          SizedBox(height: 20),
                          Text(album.name),
                          SizedBox(height: 20),
                        ],
                      )
                    ),
                  ),
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
