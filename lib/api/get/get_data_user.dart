import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String id;
  String email;
  String first_name;
  String last_name;
  String avatar;

  User({this.id, this.email, this.first_name, this.last_name, this.avatar});

  factory User.createUser(Map<String, dynamic> object) {
    return User (
      id: object['id'].toString(),
      email: object['email'],
      first_name: object['first_name'],
      last_name: object['last_name'],
      avatar: object['avatar']
    );
  }

  static Future<User> connectToAPI(String id) async {
    String apiURL = "https://reqres.in/api/users/2";
    
    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return User.createUser(userData);

  }
}