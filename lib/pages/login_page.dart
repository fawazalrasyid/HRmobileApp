import 'package:flutter/material.dart';
import 'package:hr_app/api/get/get_data_user.dart';
import 'package:hr_app/dashboard/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:toast/toast.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _key = GlobalKey();
  bool _validate = false;
  String email, pass;

  bool _value1 = false;
  bool isLoading;
  User user;

  ProgressDialog pr;

  void _value1Changed(bool value) => setState(() => _value1 = value);
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: true, showLogs: true);

    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
        top: true,
        left: true,
        right: true,
        minimum: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 32.0),
              Container(
                height: 90.0,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/roketin.png",
                  height: 100.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "Sign In",
                textAlign: TextAlign.left,
                style: style.copyWith(
                    height: 3,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 32.0),
              Form(
                key: _key,
                autovalidate: _validate,
                child: formUI(),
              ),
              SizedBox(height: 8.0),
              CheckboxListTile(
                title: Text('Remember me'),
                value: _value1,
                onChanged: _value1Changed,
                activeColor: Color(0xffFF3030),
                controlAffinity: ListTileControlAffinity.leading,
              ),
              SizedBox(height: 16.0),
              buttonLogin(),
              SizedBox(height: 16.0),
              Center(child: Text("Forgot password?")),
              SizedBox(height: 32.0),
            ]),
      )),
    );
  }

  Widget formUI() {
    return Column(
      children: <Widget>[
        TextFormField(
          controller: emailController,
          validator: validateEmail,
          onSaved: (String val) {
            email = val;
          },
          keyboardType: TextInputType.emailAddress,
          style: style,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Email",
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
        SizedBox(height: 16.0),
        TextFormField(
          controller: passwordController,
          obscureText: true,
          validator: validatePass,
          onSaved: (String val) {
            pass = val;
          },
          style: style,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: "Password",
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFF4F4F4)),
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ],
    );
  }

  Widget buttonLogin() {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(15.0),
      color: Color(0xffFF3030),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          {
            setState(() {
              //pr.show();
            });
            signIn(emailController.text, passwordController.text);
          }

          _validateField();
        },
        child: Text("Log In",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value.length == 0) {
      return "Masukkan Email";
    } else if (!regExp.hasMatch(value)) {
      return "Format email salah!";
    } else {
      return null;
    }
  }

  String validatePass(String value) {
    if (value.length == 0) {
      return "Masukkan password";
    }
  }

  _validateField() {
    if (_key.currentState.validate()) {
      // No any error in validation
      _key.currentState.save();
      print("Email $email");
      print("Password $pass");
      pr.show();
    } else {
      // validation error
      setState(() {
        _validate = true;
        pr.dismiss();
      });
    }
  }

// Fungsi login
  signIn(String email, password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'email': email, 'password': password};
    var jsonResponse;
    var response = await http.post("https://reqres.in/api/login", body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        setState(() {
          pr.hide();
          Toast.show("Selamat datang", context,
              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => Dashboard()),
            (Route<dynamic> route) => false);
      }
    } else if (response.statusCode == 400) {
      setState(() {
        pr.hide();
        Toast.show("Email atau password salah", context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      });
    } else {
      setState(() {
        pr.hide();
      });
    }
  }
}
