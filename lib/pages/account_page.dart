import 'package:flutter/material.dart';
import 'package:hr_app/login_page.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
                SizedBox(
                  height: 32.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/avatar.png',
                      height: 100.0,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'Fawaz Al Rasyid \nJunior Programmer',
                      style: textStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                SizedBox(
                  height: 100.0,
                ),
                Column(
                  children: <Widget>[
                    Container(
                      height: 30.00,
                      decoration: BoxDecoration(
                        color: Color(0xfff4f4f4),
                        borderRadius: BorderRadius.circular(15.00),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    Container(
                      height: 30.00,
                      decoration: BoxDecoration(
                        color: Color(0xfff4f4f4),
                        borderRadius: BorderRadius.circular(15.00),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 150.0,
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
