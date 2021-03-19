import 'package:flutter/material.dart';

import '../screens/welcome/welcome.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[WelcomeScreen(), WelcomeScreen(), WelcomeScreen()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), title: SizedBox.shrink()),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: SizedBox.shrink()),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: SizedBox.shrink(),),
        ],
        backgroundColor: Color.fromRGBO(255, 161, 50, 1),
        selectedItemColor: Color.fromRGBO(9, 29, 103, 1),
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 5,
      ),
    );
  }
}