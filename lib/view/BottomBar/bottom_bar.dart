import 'package:beer_collection/view/HealthPage/health_page.dart';
import 'package:beer_collection/view/HomePage/home_page.dart';
import 'package:beer_collection/view/ProfilePage/profile_page.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;

  static final List<Widget> widgetOptions = <Widget>[
    const HomePage(),
    const HealthPage(),
    const ProfilePage(),
    // TODO: v1.1以降で実装
    // const Text("Learning"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 32,
        selectedIconTheme: const IconThemeData(
          size: 40,
        ),
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blueGrey,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color(0xFF526480),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_home_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_home_filled),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_accessibility_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_accessibility_filled),
              label: "Health"),
          BottomNavigationBarItem(
              icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
              activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
              label: "Profile"),
          // TODO: v1.1以降で実装
          // BottomNavigationBarItem(
          //     icon: Icon(FluentSystemIcons.ic_fluent_book_formula_database_regular),
          //     activeIcon: Icon(FluentSystemIcons.ic_fluent_book_formula_database_filled),
          //     label: "Learning"),
          // ),
        ],
      ),
    );
  }
}
