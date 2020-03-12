import 'package:flutter/material.dart';

import 'package:hr_app/dashboard/account_page.dart';
import 'package:hr_app/dashboard/home_page.dart';
import 'package:hr_app/dashboard/report_page.dart';

class Dashboard extends StatefulWidget {
  static var tag;
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  final _layoutPage = [
    HomePage(),
    ReportPage(),
    AccountPage(),
  ];

  void _onTabItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layoutPage.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/home.png',
              height: 25.0,
            ),
            activeIcon: Image.asset(
              'assets/images/home_active.png',
              height: 25.0,
            ),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            //icon: Icon(Icons.graphic_eq),
            icon: Image.asset(
              'assets/images/history.png',
              height: 25.0,
            ),
            activeIcon: Image.asset(
              'assets/images/history_active.png',
              height: 25.0,
            ),
            title: Text('Report'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/profile.png',
              height: 25.0,
            ),
            activeIcon: Image.asset(
              'assets/images/profile_active.png',
              height: 25.0,
            ),
            title: Text('Account'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTabItem,
        fixedColor: Color(0xffFF3030),
      ),
    );
  }
}
