import 'package:actapp/backend/api.dart';
import 'package:actapp/frontend/navigation/dashboard.dart';
import 'package:actapp/frontend/navigation/profile.dart';
import 'package:actapp/frontend/navigation/project.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    DashBoard(),
    Project(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [API.appcolor, API.appcolor],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GNav(
          gap: 8,
          backgroundColor: Colors.transparent,
          color: Colors.yellow,
          activeColor: Colors.yellow,
          tabBackgroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: [
            GButton(
              icon: Icons.home_outlined,
              text: 'Dashboard',
              iconColor: Colors.white,
              textStyle: const TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.normal,
              ),
            ),
            const GButton(
              icon: Icons.mail_outline,
              text: 'Project',
              iconColor: Colors.white,
              textStyle: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.normal,
              ),
            ),
            const GButton(
              icon: Icons.person_outline,
              text: 'My Account',
              iconColor: Colors.white,
              textStyle: TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }
}
