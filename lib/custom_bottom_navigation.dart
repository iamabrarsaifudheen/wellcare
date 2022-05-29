import 'package:flutter/material.dart';
import 'package:wellcare/connect.dart';
import 'package:wellcare/messages.dart';
import 'package:wellcare/settings.dart';

class CustomBottomNavigator extends StatefulWidget {
  CustomBottomNavigator({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigator> createState() => _CustomBottomNavigatorState();
}

class _CustomBottomNavigatorState extends State<CustomBottomNavigator> {
  int _selectedIndex = 1;
  final List<Widget> _widgetOptions = <Widget>[
    Messages(),
    Connect(),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor:  Color(0xff1E3E72),
              icon: Icon(Icons.message),
              label: 'Meassges',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              backgroundColor: Color(0xff1E3E72),
              label: 'Connect',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              backgroundColor: Color(0xff1E3E72),
              label: 'Settings',
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          iconSize: 36,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
