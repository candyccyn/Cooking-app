import 'package:cooking_app/screens/main/body.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  static final routeName='/main';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}