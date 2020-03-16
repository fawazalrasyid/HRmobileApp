import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class Job {
  final int id;
  final String category;
  final String date;
  final String progress;

  Job({this.id, this.category, this.date, this.progress});

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      //id: json['id'],
      category: json['category'],
      date: json['date'],
      progress: json['progress'],
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
          return Column(children: <Widget>[
            Image.asset("assets/images/offline.png", height: 60.0),
            Text("Tidak ada koneksi",
                textAlign: TextAlign.start,
                style: text14.copyWith(color: Color(0xffA1B1BD))),
          ]);
        }
        return SpinKitThreeBounce(
          color: Color(0xffA1B1BD),
          size: 25.0,
        );
      },
    );
  }

  Future<List<Job>> _fetchJobs() async {
    final jobsListAPIUrl = 'https://hrroketinnn.000webhostapp.com/';
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
          return _tile(data[index].category, data[index].date, data[index].progress);
        });
  }

  Container _tile(String category, String date, String progress) => Container(
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
                  category,
                  style: text14bold,
                ),
                SizedBox(height: 2.0),
                Text(
                  date + ", " + progress,
                  style: text14,
                ),
              ],
            ),
          ],
        ),
      );
}
