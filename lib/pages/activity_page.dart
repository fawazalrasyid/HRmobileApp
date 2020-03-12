import 'package:flutter/material.dart';

import 'package:hr_app/itemListview/activityList.dart';

class ActivityPage extends StatefulWidget {
  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  TextStyle textStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  TextStyle textwhiteStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  TextStyle text22bold = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
  );

  TextStyle text18bold = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  TextStyle text16bold = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  TextStyle text14bold = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  );

  TextStyle text14 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14.0,
  );

  TextStyle text12 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: SingleChildScrollView(
            child: SafeArea(
          top: true,
          bottom: true,
          left: true,
          right: true,
          minimum: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 32.0,
                ),
                Stack(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.keyboard_backspace,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Aktivitas',
                        textAlign: TextAlign.center,
                        style: text16bold,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 32.0),
                JobsListView()
              ],
            ),
          ),
        )));
  }

  Container listActivityItem() {
    return new Container(
        height: 42.00,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset('assets/images/dot.png', height: 16.0),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Cuti tahunan',
                  style: text14bold,
                ),
                SizedBox(height: 2.0),
                Text('13 Feb 2020 - 15 Feb 2020, Direview', style: text14),
              ],
            ),
          ],
        ));
  }
}
