import 'package:beer_collection/view/HealthPage/health_page.dart';
import 'package:beer_collection/view/HomePage/home_page.dart';
import 'package:beer_collection/view/ProfilePage/profile_page.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const HealthPage(),
    const ProfilePage(),
    // TODO: v1.1以降で実装
    // const Text("Learning"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 32,
        selectedIconTheme: const IconThemeData(
          size: 40,
        ),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blueGrey,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color(0xFF526480),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.home_24_regular),
            activeIcon: Icon(FluentIcons.home_24_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.accessibility_24_regular),
            activeIcon: Icon(FluentIcons.accessibility_24_filled),
            label: 'Health',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.person_24_regular),
            activeIcon: Icon(FluentIcons.person_24_filled),
            label: 'Profile',
          ),
          // TODO: v1.1以降で実装
          // BottomNavigationBarItem(
          //     icon: Icon(FluentIcons.book_database_24_regular),
          //   activeIcon: Icon(FluentIcons.book_database_24_filled),
          //   label: 'Learning',
          // ),
          // ),
        ],
      ),
    );
  }
}
