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
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color.fromARGB(146, 244, 67, 54), Color.fromARGB(145, 255, 235, 59), Color.fromARGB(226, 124, 77, 255), Colors.black],
                ),
              ),
              child: ListView.builder(
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
                        padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10, top:10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children:[
                            Image.network(album.cover, fit: BoxFit.cover,),
                            const SizedBox(height: 20),
                            Text(album.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
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
