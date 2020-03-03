import 'package:flutter/material.dart';
import 'package:hr_app/splash_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'HR APP',
    home: SplashScreen(),
    theme: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        accentColor: Color(0xffFF3030),
      ),
  ));
}