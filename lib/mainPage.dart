import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:watch/home.dart';
import 'package:watch/main.dart';
import 'package:watch/profile.dart';

import 'file:///C:/Users/arsar/FlutterProject/watch/lib/Calendar/calendar.dart';
import 'file:///C:/Users/arsar/FlutterProject/watch/lib/Notification/notification.dart';
import 'file:///C:/Users/arsar/FlutterProject/watch/lib/PillBox/pillbox.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          Pillbox(),
          CalenderWatch(),
          Home(),
          NotificationWatch(),
          Profile(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        color: Colors.white,
        height: 55,
        buttonBackgroundColor:  HexColor('5DB131'),
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(
          milliseconds: 600,
        ),
        items: <Widget>[
          Icon(
            Icons.medical_services,
            size: 30,
          ),
          Icon(
            Icons.calendar_today,
            size: 30,
          ),
          Icon(
            Icons.home,
            size: 30,
          ),
          Icon(
            Icons.notifications_none,
            size: 30,
          ),
          Icon(
            Icons.people,
            size: 30,
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }

  navigationTapped(int page) {
    setState(() {
      _page = page;
    });
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
