import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String image;
  String name;
  String status;
  String email;
  String phone;
  String address;

  User(
      {this.image,
      this.name,
      this.status,
      this.email,
      this.phone,
      this.address});

  factory User.createPostResult(Map<String, dynamic> json) {
    return User(
        image: json['image'],
        name: json['name'],
        status: json['status'],
        email: json['email'],
        phone: json['phone'],
        address: json['address']);
  }

  static Future<User> connectToAPI(String image, String name, String status,
      String email, String phone, String address) async {
    String apiUrl = "URL API";
    var apiResult = await http.post(apiUrl, body: {
      "image": image,
      "name": name,
      "status": status,
      "emial": email,
      "phone": phone,
      "address": address
    });
    var jsonObject = json.decode(apiResult.body);

    return User.createPostResult(jsonObject);
  }
}
