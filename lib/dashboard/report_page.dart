import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
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

  String get year {
    return DateFormat('yyyy').format(DateTime.now());
  }


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
                    'Report',
                    style: text16bold,
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
                        Text('Tahun '+year, style: text16bold),
                        SizedBox(
                          width: 16.0,
                        ),
                        buildDropdownMonth()
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      height: 200.0,
                      child: ListView(
                        padding: EdgeInsets.all(8.0),
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          new Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(15.00),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Senin', style: text14bold),
                                    Text('22/02/2020', style: text12)
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/login.png',
                                      height: 28.0,
                                    ),
                                    SizedBox(width: 8.0),
                                    Text('08.00am', style: text14bold)
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/logout.png',
                                      height: 28.0,
                                    ),
                                    SizedBox(width: 8.0),
                                    Text('05.00pm', style: text14bold)
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(4.00)),
                          new Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(15.00),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Senin', style: text14bold),
                                    Text('22/02/2020', style: text12)
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/login.png',
                                      height: 28.0,
                                    ),
                                    SizedBox(width: 8.0),
                                    Text('08.00am', style: text14bold)
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/logout.png',
                                      height: 28.0,
                                    ),
                                    SizedBox(width: 8.0),
                                    Text('05.00pm', style: text14bold)
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(4.00)),
                          new Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(15.00),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Senin', style: text14bold),
                                    Text('22/02/2020', style: text12)
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/login.png',
                                      height: 28.0,
                                    ),
                                    SizedBox(width: 8.0),
                                    Text('08.00am', style: text14bold)
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/logout.png',
                                      height: 28.0,
                                    ),
                                    SizedBox(width: 8.0),
                                    Text('05.00pm', style: text14bold)
                                  ],
                                )
                              ],
                            ),
                          ),
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

  DropdownButton<String> buildDropdownMonth() {
    return DropdownButton<String>(
      hint: Text(
        'Bulan',
        style: text14bold,
      ),
      items: <String>['Januari', 'Februari', 'Maret ', 'April', 'Mei', 'Juni', 'Juli']
          .map((String value) {
        return new DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }
}
