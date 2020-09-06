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
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            25,
          ),
          topRight: Radius.circular(
            25,
          ),
        ),
        child: BottomAppBar(
          // shape: CircularNotchedRectangle(),
          // elevation: 8.0,
          // notchMargin: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.medical_services,
                ),
                onPressed: () {
                  setState(() {
                    _page = 0;
                  });
                  _pageController.jumpToPage(0);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.calendar_today,
                ),
                onPressed: () {
                  setState(() {
                    _page = 1;
                  });
                  _pageController.jumpToPage(1);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications_none,
                ),
                onPressed: () {
                  setState(() {
                    _page = 3;
                  });
                  _pageController.jumpToPage(3);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.people,
                ),
                onPressed: () {
                  setState(() {
                    _page = 4;
                  });
                  _pageController.jumpToPage(4);
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _page = 2;
          });
          _pageController.jumpToPage(2);
        },
        backgroundColor: HexColor('5DB131'),
        child: Image.asset(
          'assets/med.png',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void navigationTapped(int page) {
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
