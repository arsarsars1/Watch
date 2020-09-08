import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
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
          NotificationWatch(),
          Profile(),
          Home(),
        ],
      ),
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: _page,
        onTap: navigationTapped,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            16,
          ),
        ),
        elevation: 8,
        fabLocation: BubbleBottomBarFabLocation.end,
        hasNotch: true,
        hasInk: true,
        inkColor: Colors.black12,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: HexColor('5DB131'),
              icon: Icon(
                Icons.medical_services,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.medical_services,
                color: HexColor('5DB131'),
              ),
              title: Text("Medicine")),
          BubbleBottomBarItem(
              backgroundColor: HexColor('5DB131'),
              icon: Icon(
                Icons.calendar_today,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.calendar_today,
                color: HexColor('5DB131'),
              ),
              title: Text("Calendar")),
          BubbleBottomBarItem(
              backgroundColor: HexColor('5DB131'),
              icon: Icon(
                Icons.notifications_none,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.notifications_none,
                color: HexColor('5DB131'),
              ),
              title: Text("Notification")),
          BubbleBottomBarItem(
              backgroundColor: HexColor('5DB131'),
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.person,
                color: HexColor('5DB131'),
              ),
              title: Text("Profile")),
        ],
      ),
      // ClipRRect(
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(
      //       25,
      //     ),
      //     topRight: Radius.circular(
      //       25,
      //     ),
      //   ),
      //   child: BottomAppBar(
      //     // shape: CircularNotchedRectangle(),
      //     // elevation: 8.0,
      //     // notchMargin: 8,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: <Widget>[
      //         IconButton(
      //           icon: Icon(
      //             Icons.medical_services,
      //           ),
      //           onPressed: () {
      //             setState(() {
      //               _page = 0;
      //             });
      //             _pageController.jumpToPage(0);
      //           },
      //         ),
      //         IconButton(
      //           icon: Icon(
      //             Icons.calendar_today,
      //           ),
      //           onPressed: () {
      //             setState(() {
      //               _page = 1;
      //             });
      //             _pageController.jumpToPage(1);
      //           },
      //         ),
      //         IconButton(
      //           icon: Icon(
      //             Icons.notifications_none,
      //           ),
      //           onPressed: () {
      //             setState(() {
      //               _page = 3;
      //             });
      //             _pageController.jumpToPage(3);
      //           },
      //         ),
      //         IconButton(
      //           icon: Icon(
      //             Icons.people,
      //           ),
      //           onPressed: () {
      //             setState(() {
      //               _page = 4;
      //             });
      //             _pageController.jumpToPage(4);
      //           },
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
          // setState(() {
          //   _page = 4;
          // });
          // _pageController.jumpToPage(4);
        },
        backgroundColor: HexColor('5DB131'),
        child: Image.asset(
          'assets/med.png',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
