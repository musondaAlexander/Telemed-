import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:telemed/pages/chat_page.dart';
import 'package:telemed/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'doctor_page.dart';
import 'home_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> _pages = [
    HomePage(),
    DoctorPage(),
    ChatPage(),
    Container(),
    Container()
  ];

  int _currentIndex = 0;
  PageController _pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: _pages),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              activeColor: primary,
              inactiveColor: Colors.black,
              title: const Text('Home'),
              icon: const Icon(Icons.home)),
          BottomNavyBarItem(
              activeColor: primary,
              inactiveColor: Colors.black,
              title: const Text('Doctor'),
              icon: const Icon(Icons.medical_services_rounded)),
          BottomNavyBarItem(
              activeColor: primary,
              inactiveColor: Colors.black,
              title: const Text('Chat'),
              icon: const Icon(CupertinoIcons.chat_bubble_2_fill)),
          BottomNavyBarItem(
              activeColor: primary,
              inactiveColor: Colors.black,
              title: const Text('Booking'),
              icon: const Icon(Icons.event_note_rounded)),
          BottomNavyBarItem(
              activeColor: primary,
              inactiveColor: Colors.black,
              title: const Text('Account'),
              icon: const Icon(Icons.manage_accounts_rounded)),
        ],
      ),
    );
  }
}
