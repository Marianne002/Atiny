///
/// model/track.dart
///

import 'package:atiny_app/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Albums {
  int? id;
  String? name;
  String? releaseYear;
  String? description;
  String? cover;
  List<Tracks>? tracks;

  Albums(
    {
      this.id,
      this.name,
      this.releaseYear,
      this.description,
      this.cover,
      this.tracks
    }
  );

  Albums.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    releaseYear = json['release_year'];
    description = json['description'];
    cover = json['cover'];
    if (json['tracks'] != null) {
      tracks = <Tracks>[];
      json['tracks'].forEach((v) {
        tracks!.add( Tracks.fromJson(v));
      });
    }
  }

 
}



class Tracks {
  int? id;
  String? title;
  String? lyrics;

  Tracks({this.id, this.title, this.lyrics});

  Tracks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    lyrics = json['lyrics'];
  }

  
}


class AlbumHttp {
  Future<List<Albums>> getAlbums() async {
    final response = await http.get(trackUrl);
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Albums> datas = body
          .map(
            (dynamic item) => Albums.fromJson(item),
          )
          .toList();
      return datas;
    } else {
      throw Exception('Failed to fetch albums');
    }
  }
  
  Future<List<Tracks>> getTracks(int albumId) async {
    final response = await http.get(trackUrl);

    if (response.statusCode == 200) {
      final Map<String, dynamic> albumJson = json.decode(response.body);
      final List<dynamic> tracksJson = albumJson['tracks'];

      final List<Tracks> tracks = tracksJson
        .map((trackJson) => Tracks.fromJson(trackJson))
        .toList();

      return tracks;
    } else {
      throw Exception('Failed to fetch tracks');
    }
  } 
}

///
///
/*
import 'package:atiny_app/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Album {
  int id;
  String name;
  int releaseYear;
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
    final List<dynamic> tracksJson = json['tracks'];

    
    final List<Track> tracks = tracksJson
      .map((trackJson) => Track.fromJson(trackJson))
      .toList()
    ; 

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
  Future<List<Album>> getAlbums() async {
    final response = await http.get(trackUrl);

    if (response.statusCode == 200) {
      final List<dynamic> albumsJson = json.decode(response.body);
      return albumsJson.map((json) => Album.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch albums');
    }
  }
  
  Future<List<Track>> getTracks(int albumId) async {
    final response = await http.get(trackUrl);

    if (response.statusCode == 200) {
      final Map<String, dynamic> albumJson = json.decode(response.body);
      final List<dynamic> tracksJson = albumJson['tracks'];

      final List<Track> tracks = tracksJson
        .map((trackJson) => Track.fromJson(trackJson))
        .toList();

      return tracks;
    } else {
      throw Exception('Failed to fetch tracks');
    }
  } 
}*/