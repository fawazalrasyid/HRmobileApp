import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  TextStyle textStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  TextStyle textdropStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
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
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 32.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Report',
                    style: textStyle,
                  )
                ],
              ),
              SizedBox(
                height: 32.0,
              ),
              Container(
                height: 700.0,
                decoration: BoxDecoration(
                  color: Color(0xfff4f4f4),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.00),
                    topRight: Radius.circular(15.00),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        DropdownButton<String>(
                          hint: Text(
                            'Tahun',
                            style: textdropStyle,
                          ),
                          items: <String>['2018', '2019', '2020', '2021']
                              .map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        DropdownButton<String>(
                          hint: Text(
                            'Bulan',
                            style: textdropStyle,
                          ),
                          items: <String>[
                            'Januari',
                            'Februari',
                            'Maret ',
                            'April'
                          ].map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {},
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      height: 150.0,
                      child: ListView(
                        padding: EdgeInsets.all(8.0),
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          new Container(
                            height: 36.00,
                            width: 275.00,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(15.00),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(4.00)),
                          new Container(
                            height: 36.00,
                            width: 275.00,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(15.00),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(4.00)),
                          new Container(
                            height: 36.00,
                            width: 275.00,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(15.00),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
