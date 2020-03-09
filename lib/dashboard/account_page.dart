import 'package:flutter/material.dart';
import 'package:hr_app/login_page.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  
  TextStyle textStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 18.0,
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

  TextStyle text16 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16.0,
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
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 32.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Account',
                      style: textStyle,
                    )
                  ],
                ),
                SizedBox(height: 64.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipOval(
                      child: Image.asset(
                        'assets/images/avatar.png',
                        height: 100.0,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'User',
                      style: text16bold,
                      textAlign: TextAlign.center,
                    ),
                    Text('Junior Programmer', style: text16,)
                  ],
                ),
                SizedBox(
                  height: 100.0,
                ),
                Column(
                  children: <Widget>[
                    Container(
                        //height: 50.00,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Color(0xfff4f4f4),
                          borderRadius: BorderRadius.circular(15.00),
                        ),
                        child: InkWell(
                          // onTap: () {
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => EditAccountPage()),
                          //   );
                          // },
                          child: Row(
                            children: <Widget>[
                              Image.asset('assets/images/account.png',
                                  height: 28.0),
                              SizedBox(
                                width: 16.0,
                              ),
                              Text(
                                'Edit Profile',
                                style: text14bold,
                              )
                            ],
                          ),
                        )),
                    Padding(padding: EdgeInsets.all(4.0)),
                    Container(
                      //height: 50.00,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Color(0xfff4f4f4),
                        borderRadius: BorderRadius.circular(15.00),
                      ),
                      child: Row(
                        children: <Widget>[
                          Image.asset('assets/images/help.png', height: 28.0),
                          SizedBox(
                            width: 16.0,
                          ),
                          Text(
                            'Edit Profile',
                            style: text14bold,
                          )
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(4.0)),
                    Container(
                      //height: 50.00,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Color(0xfff4f4f4),
                        borderRadius: BorderRadius.circular(15.00),
                      ),
                      child: Row(
                        children: <Widget>[
                          Image.asset('assets/images/help.png', height: 28.0),
                          SizedBox(
                            width: 16.0,
                          ),
                          Text(
                            'Help',
                            style: text14bold,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100.0,
                ),
                Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xffFF3030),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) {
                          return LoginPage();
                        }),
                      );
                    },
                    child: Text(
                      'Logout',
                      textAlign: TextAlign.center,
                      style: textwhiteStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 32.0,
                )
              ],
            ),
          ),
        )));
  }
}
