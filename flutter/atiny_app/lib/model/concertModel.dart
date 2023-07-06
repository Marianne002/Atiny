///
/// model/concert.dart
///
import 'package:atiny_app/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Concert {
  int id;
  String date;
  String address;

  Concert(
    {
      required this.id,
      required this.date,
      required this.address,
    }
  );

  factory Concert.fromJson(Map<String, dynamic> json) {
    return Concert(
      id: json['id'], 
      date: json['date'], 
      address: json['address'],
    );
  }
}

class ConcertHttp {
  Future<List<Concert>> getAll() async {
    final res = await http.get(concertUrl);
    if(res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Concert> datas = body
        .map(
          (dynamic item) => Concert.fromJson(item),
        )
        .toList();
      return datas;
    } else {
      throw "Error.";
    }
  }
}