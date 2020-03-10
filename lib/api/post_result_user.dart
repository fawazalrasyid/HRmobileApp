import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String name;
  String status;

  User({this.name, this.status});

  factory User.createPostResult(Map<String, dynamic> json){
    return User(
      name: json['name'],
      status: json['status'],
    );
  }

  static Future<User> connectToAPI(String name, String status) async{
      String apiUrl = "URL API";
      var apiResult = await http.post(apiUrl, body: {"name" : name, "status" : status});
      var jsonObject = json.decode(apiResult.body);

      return User.createPostResult(jsonObject);
  }
}