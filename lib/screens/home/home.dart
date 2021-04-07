import 'package:cooking_app/widgets/home_widgets/homeBody.dart';
import 'package:cooking_app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/discover";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: HomeBody(),
        // bottomNavigationBar: new Navigation(navCallback: (i) => print("Navigating to $i"))
    );
  }
}