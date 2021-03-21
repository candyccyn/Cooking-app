import 'package:flutter/material.dart';

import 'package:cooking_app/screens/home/home.dart';
import 'package:cooking_app/screens/welcome/welcome.dart';

class NavigationData {
  List<Widget> widgetOptions = <Widget>[
    WelcomeScreen(),
    HomeScreen(),
    WelcomeScreen()
  ];
}
