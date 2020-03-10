import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String image;
  String name;
  String status;
  String email;
  String phone;
  String address;

  User({this.image, this.name, this.status, this.email, this.phone, this.address});

  factory User.createUser(Map<String, dynamic> object) {
    return User (
      image: object['image'],
      name: object['name'],
      status: object['status'],
      email: object['email'],
      phone: object['phone'],
      address: object['address']
    );
  }

  static Future<User> connectToAPI(String name) async {
    String apiURL = "URL API" + name;
    
    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return User.createUser(userData);

  }
}