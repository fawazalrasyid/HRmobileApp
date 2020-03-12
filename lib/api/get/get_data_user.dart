import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String id;
  String image;
  String firstName;
  String lastName;
  // String status;
  String email;
  // String phone;
  // String address;

  User({this.id, this.image, this.firstName, this.lastName, /*this.status*/ this.email, /*this.phone*/ /*this.address*/});

  factory User.createUser(Map<String, dynamic> object) {
    return User (
      id: object['id'].toString(),
      image: object['image'],
      firstName: object['firstName'],
      lastName: object['lastName'],
      // status: object['status'],
      email: object['email'],
      // phone: object['phone'],
      // address: object['address']
    );
  }

  static Future<User> connectToAPI(String id) async {
    String apiURL = "https://reqres.in/" + id;
    
    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return User.createUser(userData);

  }
}