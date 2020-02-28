import 'package:flutter/material.dart';

class CutiPage extends StatefulWidget {
  @override
  _CutiPageState createState() => _CutiPageState();
}

class _CutiPageState extends State<CutiPage> {
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
            child: Column(
              children: <Widget>[
                SizedBox(height: 32.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Cuti',
                      style: text16bold,
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xfff4f4f4),
                    borderRadius: BorderRadius.circular(15.00),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Cuti tahunan", style: text16bold),
                      SizedBox(height: 16.0),
                      Text("8 Hari tersisa", style: text18bold),
                      SizedBox(height: 4.0),
                      Text("Sisa kuota sampai Des 2020", style: text12),
                      SizedBox(height: 32.0),
                      Container(height: 1.0, color: Color(0xff707070)),
                      SizedBox(height: 16.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                        Text("Kuota\n10", style: text18bold, textAlign: TextAlign.center),
                        Text("Terpakai\n2", style: text18bold, textAlign: TextAlign.center),
                      ],)
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
