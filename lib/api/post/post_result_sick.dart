import 'dart:convert';
import 'package:http/http.dart' as http;

class Sick {
  String startDate;
  String lastDate;
  String letter;

  Sick({this.startDate, this.lastDate, this.letter});

  factory Sick.createToRsult(Map<String, dynamic> json) {
    return Sick(
        startDate: json['startDate'],
        lastDate: json['lastDate'],
        letter: json['letter']);
  }

  static Future<Sick> connectToAPI(
      String startDate, String lastDate, String letter) async {
    String apiUrl = "URL API";
    var apiResutl = await http.post(apiUrl,
        body: {"startDate": startDate, "lastDate": lastDate, "letter": letter});
    var jsonObject = json.decode(apiResutl.body);

    return Sick.createToRsult(jsonObject);
  }
}
