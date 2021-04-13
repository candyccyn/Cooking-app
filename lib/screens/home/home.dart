import 'package:cooking_app/services/menu_service.dart';
import 'package:cooking_app/widgets/home_widgets/body.dart';
import 'package:cooking_app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/discover";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Body(),
      body: ChangeNotifierProvider<MenuProvider>(
        child: Body(),
        create: (BuildContext context) => MenuProvider(),
      ),
      // bottomNavigationBar: new Navigation(navCallback: (i) => print("Navigating to $i"))
    );
  }
}
