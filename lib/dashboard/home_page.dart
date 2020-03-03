import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hr_app/pages/absensi_page.dart';
import 'package:hr_app/pages/leave_page.dart';
import 'package:hr_app/pages/permission_page.dart';
import 'package:hr_app/pages/remote_page.dart';
import 'package:hr_app/pages/sick_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
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
                          'Fawaz Al Rasyid \nJunior Programmer',
                          style: text16bold,
                        ),
                        Image.asset('assets/images/avatar.png', height: 50.0),
                      ],
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      //physics: BouncingScrollPhysics(),
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      children: <Widget>[
                        Container(
                          height: 90.00,
                          child: Card(
                            color: Color(0xffF4F4F4),
                            margin: EdgeInsets.all(4.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LeavePage()),
                                );
                              },
                              child: Center(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/ic_calendar.png',
                                        height: 30.0,
                                      ),
                                      SizedBox(height: 10.0),
                                      Text("Cuti", style: text14bold),
                                    ]),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 0,
                          ),
                        ),
                        Container(
                          height: 90.00,
                          child: Card(
                            color: Color(0xffF4F4F4),
                            margin: EdgeInsets.all(4.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PermissionPage()),
                                );
                              },
                              child: Center(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/ic_check.png',
                                        height: 30.0,
                                      ),
                                      SizedBox(height: 10.0),
                                      Text(
                                        "Izin",
                                        style: text14bold,
                                      ),
                                    ]),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 0,
                          ),
                        ),
                        Container(
                          height: 90.00,
                          child: Card(
                            color: Color(0xffF4F4F4),
                            margin: EdgeInsets.all(4.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SickPage()),
                                );
                              },
                              child: Center(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/ic_sick.png',
                                        height: 30.0,
                                      ),
                                      SizedBox(height: 10.0),
                                      Text(
                                        "Sakit",
                                        style: text14bold,
                                      ),
                                    ]),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 0,
                          ),
                        ),
                        Container(
                          height: 90.00,
                          child: Card(
                            color: Color(0xffF4F4F4),
                            margin: EdgeInsets.all(4.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AbsensiPage()),
                                );
                              },
                              child: Center(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/ic_clock.png',
                                        height: 30.0,
                                      ),
                                      SizedBox(height: 10.0),
                                      Text(
                                        "Absensi",
                                        style: text14bold,
                                      ),
                                    ]),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 0,
                          ),
                        ),
                        Container(
                          height: 90.00,
                          child: Card(
                            color: Color(0xffF4F4F4),
                            margin: EdgeInsets.all(4.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RemotePage()),
                                );
                              },
                              child: Center(
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/ic_remote.png',
                                        height: 30.0,
                                      ),
                                      SizedBox(height: 10.0),
                                      Text(
                                        "Remote",
                                        style: text14bold,
                                      ),
                                    ]),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Ringkasan',
                              style: text16bold,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      height: 120.0,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          new Container(
                            height: 120.00,
                            width: 250.00,
                            child: Card(
                              margin: EdgeInsets.all(16.0),
                              elevation: 0.0,
                              color: Color(0xffF4F4F4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Cuti Tahunan',
                                    style: text14bold,
                                  ),
                                  SizedBox(
                                    height: 16.0,
                                  ),
                                  Text(
                                    '10hari',
                                    style: text22bold,
                                  ),
                                  Text(
                                    'sisa cuti',
                                    style: text14,
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xfff4f4f4),
                              borderRadius: BorderRadius.circular(15.00),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(4.00)),
                          new Container(
                            height: 120.00,
                            width: 250.00,
                            child: Card(
                              margin: EdgeInsets.all(16.0),
                              elevation: 0.0,
                              color: Color(0xffF4F4F4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Cuti Tahunan',
                                    style: text14bold,
                                  ),
                                  SizedBox(
                                    height: 16.0,
                                  ),
                                  Text(
                                    '10hari',
                                    style: text22bold,
                                  ),
                                  Text(
                                    'sisa cuti',
                                    style: text14,
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xfff4f4f4),
                              borderRadius: BorderRadius.circular(15.00),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(4.00)),
                          new Container(
                            height: 120.00,
                            width: 250.00,
                            child: Card(
                              margin: EdgeInsets.all(16.0),
                              elevation: 0.0,
                              color: Color(0xffF4F4F4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Cuti Tahunan',
                                    style: text14bold,
                                  ),
                                  SizedBox(
                                    height: 16.0,
                                  ),
                                  Text(
                                    '10hari',
                                    style: text22bold,
                                  ),
                                  Text(
                                    'sisa cuti',
                                    style: text14,
                                  ),
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xfff4f4f4),
                              borderRadius: BorderRadius.circular(15.00),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 36.0),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Aktivitas',
                              style: text16bold,
                            ),
                            Text(
                              'Lihat Semua',
                              style: text14.copyWith(
                                color: Color(0xff456EFE),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      height: 150.0,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          Container(
                            height: 42.00,
                            child: Row(
                              children: <Widget>[
                                Image.asset('assets/images/dot.png',
                                    color: Colors.grey, height: 16.0),
                                SizedBox(width: 16.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Cuti tahunan',
                                      style: text14bold,
                                    ),
                                    SizedBox(height: 2.0),
                                    Text('13 Feb 2020 - 15 Feb 2020, Direview',
                                        style: text14),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(4.00)),
                          Container(
                            height: 42.00,
                            child: Row(
                              children: <Widget>[
                                Image.asset('assets/images/dot.png',
                                    color: Colors.red, height: 16.0),
                                SizedBox(width: 16.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Cuti tahunan',
                                      style: text14bold,
                                    ),
                                    SizedBox(height: 2.0),
                                    Text('13 Feb 2020 - 15 Feb 2020, Ditolak',
                                        style: text14),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(4.00)),
                          Container(
                            height: 42.00,
                            child: Row(
                              children: <Widget>[
                                Image.asset('assets/images/dot.png',
                                    height: 16.0),
                                SizedBox(width: 16.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Cuti tahunan',
                                      style: text14bold,
                                    ),
                                    SizedBox(height: 2.0),
                                    Text('13 Feb 2020 - 15 Feb 2020, Disetujui',
                                        style: text14),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}
