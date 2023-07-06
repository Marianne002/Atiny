///
///screen/concerts.dart
///
import 'package:flutter/material.dart';
import '../model/concertModel.dart';

class ConcertsScreen extends StatelessWidget {
  final ConcertHttp concertHttp = ConcertHttp();

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: concertHttp.getAll(),
        builder: (context, AsyncSnapshot<List<Concert>> snapshot) {
          if (snapshot.hasData) {
            final concerts = snapshot.data!;
            return ListView.builder(
              itemCount: concerts.length,
              itemBuilder: (context, index) {
                final concert = concerts[index];
                return ListTile(
                  //leading: Image.network(concert.image),
                  title: Text(concert.date),
                  subtitle: Text(concert.address),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}



/**.map((Concert concert) => ListTile(
                    //leading: Image.network(concert.image),
                    title: Text(concert.date),
                    subtitle: Text(concert.adress),
                  ))
 * class listConcerts extends StatelessWidget {
  const listConcerts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        itemBuilder: (BuildContext ctxt, int index) {
          //
          var article = values[index];
          return ListTile(
            leading: Image.asset("assets/${article["img"]}"),
            title: Text(article["name"]),
            subtitle: Text(article["description"]),
          );
        },
        separatorBuilder: (context, index) => Divider(color: Colors.amber),
        itemCount: values.length,
      ),
    );
  }
} 
 */