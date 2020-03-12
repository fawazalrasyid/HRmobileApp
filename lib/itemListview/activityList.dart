import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class Job {
  final int id;
  final String position;
  final String company;
  final String description;

  Job({this.id, this.position, this.company, this.description});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      position: json['position'],
      company: json['company'],
      description: json['description'],
    );
  }
}

TextStyle text14bold = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
);

TextStyle text14 = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 14.0,
);

class JobsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Job>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Job> data = snapshot.data;
          return _jobsListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return SpinKitThreeBounce(
          color: Color(0xffA1B1BD),
          size: 25.0,
        );
      },
    );
  }

  Future<List<Job>> _fetchJobs() async {
    final jobsListAPIUrl = 'https://mock-json-service.glitch.me/';
    final response = await http.get(jobsListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new Job.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  ListView _jobsListView(data) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index].position, data[index].company);
        });
  }

  Container _tile(String title, String subtitle) => Container(
        height: 42.00,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/images/dot.png',
              height: 16.0,
              color: Colors.red,
            ),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: text14bold,
                ),
                SizedBox(height: 2.0),
                Text(
                  subtitle,
                  style: text14,
                ),
              ],
            ),
          ],
        ),
      );
}
