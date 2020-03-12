import 'package:flutter/material.dart';
import 'package:hr_app/pages/login_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  // var userData;
  SharedPreferences sharedPreferences;


  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    // getDataUserInfo();
  }

  void checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          (Route<dynamic> route) => false);
    }
  }

  // void getDataUserInfo() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   var userJson = sharedPreferences.get('user');
  //   var user = json.decode(userJson);
  //   setState(() {
  //     userData  = user;
  //   });
  // }

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
                        width: 100.0,
                        fit: BoxFit.fill,
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
                    Text(
                      'Junior Programmer',
                      style: text16,
                    )
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "My info",
                      style: text16bold,
                    ),
                    Padding(padding: EdgeInsets.all(16.0)),
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Email",
                        style: text14),
                        SizedBox(height: 8.0),
                        Text(
                          "oliver@gmail.com", 
                          // userData != null ? '${userData['email']}' : 'Data not found', /* Function get data user email */
                        style: text16bold),
                        Divider(color: Colors.black)
                      ],
                    )),
                    Padding(padding: EdgeInsets.all(4.0)),
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Mobile phone", style: text14),
                        SizedBox(height: 8.0),
                        Text(
                          "+62 8389833838", 
                          // userData != null ? '${userData['phone']}' : 'Data not found', /* Function get data user phone */
                          style: text16bold),
                        Divider(color: Colors.black)
                      ],
                    )),
                    Padding(padding: EdgeInsets.all(4.0)),
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Address", style: text14),
                        SizedBox(height: 8.0),
                        Text(
                          "Jl. Asia Afrika", 
                          // userData != null ? '${userData['address']}' : 'Data not found', /* Function get data user address */
                          style: text16bold),
                        Divider(color: Colors.black)
                      ],
                    )),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                Material(
                  elevation: 2.0,
                  borderRadius: BorderRadius.circular(15.0),
                  color: Color(0xffFF3030),
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () {
                      Alert(
                        context: context,
                        type: AlertType.warning,
                        title: "Apakah anda yakin ingin logout?",
                        buttons: [
                          DialogButton(
                              child: Text("Log Out",
                                  style:
                                      text16bold.copyWith(color: Colors.white)),
                              onPressed: () {
                                sharedPreferences.clear();
                                sharedPreferences.commit();
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            LoginPage()),
                                    (Route<dynamic> route) => true);
                              },
                              color: Color(0xffFF3030)),
                          DialogButton(
                              child: Text("Batal",
                                  style:
                                      text16bold.copyWith(color: Colors.white)),
                              onPressed: () => Navigator.pop(context),
                              color: Color(0xff1CCD9D))
                        ],
                      ).show();
                    },
                    child: Text(
                      'Log Out',
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
        ),
      ),
    );
  }
}
