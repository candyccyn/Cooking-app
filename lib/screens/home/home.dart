import 'package:cooking_app/screens/welcome/welcome.dart';
import 'package:cooking_app/widgets/home_widgets/body.dart';
import 'package:cooking_app/widgets/home_widgets/header.dart';
import 'package:cooking_app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  static String routeName = "/discover";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: new Navigation(navCallback: (i) => print("Navigating to $i"))
    );
  }

}

// class HomeScreen extends StatefulWidget {
//   static String routeName = "/discover";
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   List<Widget> _children = [
//     WelcomeScreen(),
//     Body(),
//     WelcomeScreen()
//   ];
//
//   NavigationViewModel navigationVM = NavigationViewModel();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: _children[navigationVM.selectedIndex],
//         bottomNavigationBar: new Navigation(navCallback: (i) => print(i))
//     );
//   }
// }