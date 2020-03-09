import 'dart:convert';
import 'package:http/http.dart' as http;

class Date {
  String day;
  String month;
  String years;

  Date({this.day, this.month, this.years});

  factory Date.createPostResult(Map<String, dynamic> json){
    return Date(
      day: json['day'],
      month: json['month'],
      years: json['years']
    );
  }

  static Future<Date> connectToAPI(String day, String month, String years) async{
      String apiUrl = "URL API";
      var apiResult = await http.post(apiUrl, body: {"day" : day, "month" : month, "years" : years});
      var jsonObject = json.decode(apiResult.body);

      return Date.createPostResult(jsonObject);
  }
}