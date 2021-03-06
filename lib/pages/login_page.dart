import 'package:flutter/material.dart';
import 'package:hr_app/api/get/get_data_user.dart';
import 'package:hr_app/dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

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
  bool isLoading = false;
  User user;

  void _value1Changed(bool value) => setState(() => _value1 = value);
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      controller: emailController,
      cursorColor: Colors.black,
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
      controller: passwordController,
      cursorColor: Colors.black,
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
        onPressed: emailController.text == "" || passwordController.text == ""
            ? null
            : () {
                setState(() {
                  isLoading = true;
                });
                signIn();
              },
        child: Text("Log In",
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
                // textSection(),
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

// Fungsi login
  signIn() async {
    final data = {
      'email': emailController.text,
      'password': passwordController.text
    };
    var jsonResponse;
    var response = await http.post("https://reqres.in/api/login", body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        setState(() {
          isLoading = false;
        });

        User.connectToAPI("2").then((value) {
          user = value;
          setState(() {});
        });
      }
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("token", jsonResponse['token']);
      pref.setString("email", emailController.value.text);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Dashboard()),
          (Route<dynamic> route) => false);
    } else {
      setState(() {
        isLoading = false;
      });
      print(response.body);
    }
  }
}
