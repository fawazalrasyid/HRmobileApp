import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String day;
  String month;
  String year;
 

  User({this.day, this.month, this.year});

  factory User.createUser(Map<String, dynamic> object) {
    return User (
      day: object['day'],
      month: object['month'],
      year: object['year'],
    );
  }

  static Future<User> connectToAPI(String month) async {
    String apiURL = "URL API" + month;
    
    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return User.createUser(userData);

  }
}