import 'package:cooking_app/widgets/home_widgets/header.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  static String routeName = "/discover";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Header(),

    );
  }

}