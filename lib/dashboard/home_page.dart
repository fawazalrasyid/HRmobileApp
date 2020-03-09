import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hr_app/menu/absensi_page.dart';
import 'package:hr_app/menu/leave_page.dart';
import 'package:hr_app/menu/permission_page.dart';
import 'package:hr_app/menu/remote_page.dart';
import 'package:hr_app/menu/sick_page.dart';
import 'package:hr_app/pages/activity_page.dart';

class HomePage extends StatefulWidget {
  static var tag;

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

  TextStyle text16 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16.0,
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
              buildUserData(
                  "Users",
                  "Junior Programmer",
                  Image.asset(
                    "assets/images/avatar.png",
                    height: 55,
                  )),
              SizedBox(
                height: 32.0,
              ),
              GridView.count(
                shrinkWrap: true,
                //physics: BouncingScrollPhysics(),
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                children: <Widget>[
                  buildCardLeave(context),
                  buildCardPermission(context),
                  buildCardSick(context),
                  buildCardAbsensi(context),
                  buildCardRemote(context),
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
                    buildCard("Cuti tahunan", "10 Hari", "Sisa cuti"),
                    Padding(padding: EdgeInsets.all(4.00)),
                    buildCard("Total izin", "5 Hari", "Izin"),
                    Padding(padding: EdgeInsets.all(4.00)),
                    buildCard("Total sakit", "6 Hari", "Sakit"),
                    Padding(padding: EdgeInsets.all(4.00)),
                    buildCard("Total remote", "2 Hari", "Remote"),
                  ],
                ),
              ),
              SizedBox(height: 38.0),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Aktivitas',
                        style: text16bold,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ActivityPage()),
                          );
                        },
                        child: Text(
                          'Lihat Semua',
                          style: text14.copyWith(
                            color: Color(0xff456EFE),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Container(
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) =>
                        listItem()),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildUserData(String name, status, Image image) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                textAlign: TextAlign.left,
                style: text16bold,
              ),
              Text(
                status,
                style: text16,
              ),
            ],
          ),
        ),
        ClipOval(
          child: image,
        ),
      ],
    );
  }

  Container buildCardRemote(BuildContext context) {
    return Container(
      height: 90.00,
      child: Card(
        color: Color(0xffF4F4F4),
        margin: EdgeInsets.all(4.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RemotePage()),
            );
          },
          child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
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
    );
  }

  Container buildCardAbsensi(BuildContext context) {
    return Container(
      height: 90.00,
      child: Card(
        color: Color(0xffF4F4F4),
        margin: EdgeInsets.all(4.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AbsensiPage()),
            );
          },
          child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
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
    );
  }

  Container buildCardSick(BuildContext context) {
    return Container(
      height: 90.00,
      child: Card(
        color: Color(0xffF4F4F4),
        margin: EdgeInsets.all(4.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SickPage()),
            );
          },
          child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
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
    );
  }

  Container buildCardPermission(BuildContext context) {
    return Container(
      height: 90.00,
      child: Card(
        color: Color(0xffF4F4F4),
        margin: EdgeInsets.all(4.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PermissionPage()),
            );
          },
          child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
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
    );
  }

  Container buildCardLeave(BuildContext context) {
    return Container(
      height: 90.00,
      child: Card(
        color: Color(0xffF4F4F4),
        margin: EdgeInsets.all(4.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LeavePage()),
            );
          },
          child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
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
    );
  }

  Container buildCard(String title, information, point) {
    return new Container(
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
              title,
              style: text14bold,
            ),
            SizedBox(
              height: 16.0,
            ),
            Text(
              information,
              style: text22bold,
            ),
            Text(
              point,
              style: text14,
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: Color(0xfff4f4f4),
        borderRadius: BorderRadius.circular(15.00),
      ),
    );
  }

  Container listItem() {
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
