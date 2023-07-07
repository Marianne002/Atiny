// ignore: file_names
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart';

class Album {
  int id;
  String name;
  String releaseYear;
  String description;
  String cover;
  List<Track> tracks;

  Album({
    required this.id,
    required this.name,
    required this.releaseYear,
    required this.description,
    required this.cover,
    required this.tracks,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    List<dynamic> trackList = json['tracks'] as List<dynamic>;
    List<Track> tracks = trackList.map((trackJson) {
      return Track.fromJson(trackJson);
    }).toList();

    return Album(
      id: json['id'],
      name: json['name'],
      releaseYear: json['release_year'],
      description: json['description'],
      cover: json['cover'],
      tracks: tracks,
    );
  }
}

class Track {
  int id;
  String title;
  String lyrics;

  Track({
    required this.id,
    required this.title,
    required this.lyrics,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      id: json['id'],
      title: json['title'],
      lyrics: json['lyrics'],
    );
  }
}

class AlbumHttp {
  Future<List<Album>> getAll() async {
    final res = await http.get(trackUrl);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Album> datas = body
          .map(
            (dynamic item) => Album.fromJson(item),
          )
          .toList();
      return datas;
    } else {
      throw "Error.";
    }
  }
}