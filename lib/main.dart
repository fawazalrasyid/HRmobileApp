import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hr_app/splash_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //systemNavigationBarColor: Colors.white,
    statusBarColor: Color(0xffA1B1BD), // status bar color
  ));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Roketin HR APP',
    home: SplashScreen(),
    theme: ThemeData(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      accentColor: Color(0xffff6c5b),
      primaryColor: Color(0xffFF3030),
      primaryColorDark: Color(0xffc30006),
    ),
  ));
}
