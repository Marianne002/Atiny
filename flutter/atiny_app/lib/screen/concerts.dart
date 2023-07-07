///
///screen/concerts.dart
///
import 'package:flutter/material.dart';
import '../model/concertModel.dart';

// ignore: use_key_in_widget_constructors
class ConcertsScreen extends StatelessWidget {
  final ConcertHttp concertHttp = ConcertHttp();

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Concerts',
          //style: heading,
        ),
      ),
      body: FutureBuilder(
        future: concertHttp.getAll(),
        builder: (context, AsyncSnapshot<List<Concert>> snapshot) {
          if (snapshot.hasData) {
            final concerts = snapshot.data!;
            return ListView.separated(
              itemCount: concerts.length,
              separatorBuilder: (context, index) => const Divider(
                color: Colors.grey, // Customize the separator color as desired
              ),
              itemBuilder: (context, index) {
                final concert = concerts[index];
                return ListTile(
                  leading: Image.network(concert.image),
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
