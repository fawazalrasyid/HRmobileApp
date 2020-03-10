import 'package:flutter/material.dart';
import 'package:hr_app/dashboard/dashboard.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  bool _value1 = false;
  void _value1Changed(bool value) => setState(() => _value1 = value);

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Email",
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFF4F4F4)),
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFF3030)),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Password",
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFF4F4F4)),
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFF3030)),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
    final loginButon = Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(15.0),
      color: Color(0xffFF3030),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) {
              return Dashboard();
            }),
          );
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 100.0,
                  child: Image.asset(
                    "assets/roketin.png",
                    height: 100.0,
                  ),
                ),
                SizedBox(height: 32.0),
                Text(
                  "Sign In",
                  textAlign: TextAlign.left,
                  style: style.copyWith(
                      height: 3,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16.0),
                emailField,
                SizedBox(height: 16.0),
                passwordField,
                SizedBox(height: 8.0),
                CheckboxListTile(
                  title: Text('Remember me'),
                  value: _value1,
                  onChanged: _value1Changed,
                  activeColor: Color(0xffFF3030),
                  controlAffinity: ListTileControlAffinity.leading,
                ),
                SizedBox(height: 32.0),
                loginButon,
                SizedBox(
                  height: 16.0,
                ),
                Center(child: Text("Forgot password?")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
