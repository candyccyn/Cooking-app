import 'package:cooking_app/view_models/navigation_view_model.dart';
import 'package:flutter/material.dart';

import '../screens/home/home.dart';
import '../screens/welcome/welcome.dart';
import 'home_widgets/header.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key key}) : super(key: key);
  static String routeName = "/navigate";

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  NavigationViewModel navigationVM = NavigationViewModel();
  // int _selectedIndex = 1;
  // List<Widget> _widgetOptions = <Widget>[WelcomeScreen(), HomeScreen(), WelcomeScreen()];

  void _onItemTapped(int index) {
    setState(() {
      // _selectedIndex = index;
      navigationVM.selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: _widgetOptions.elementAt(_selectedIndex),
        child: navigationVM.getWidget(1),

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
        // currentIndex: _selectedIndex,
        currentIndex: navigationVM.selectedIndex,
        onTap: _onItemTapped,
        elevation: 5,
      ),
    );
  }
}