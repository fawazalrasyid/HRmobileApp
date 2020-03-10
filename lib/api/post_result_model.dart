import 'dart:convert';
import 'package:http/http.dart' as http;


class Model {
  // Response
  String startDate;
  String lastDate;
  String reason;

  Model({this.startDate, this.lastDate, this.reason});

  factory Model.createLeave(Map<String, dynamic> json){
    return Model(
      startDate: json['startDate'],
      lastDate: json['lastDate'],
      reason: json['reason']
    );
  }

  static Future<Model> connectToAPI(String startDate, String lastDate, String reason) async {
      String apiUrl = "URL API";
      var apiResult = await http.post(apiUrl, body: {"startDate": startDate,"lastDate": lastDate, "reason" : reason});
      var jsonObject = json.decode(apiResult.body);

      return Model.createLeave(jsonObject);
  }
}
