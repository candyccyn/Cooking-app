import 'package:cooking_app/view_models/menu_provider.dart';
import 'package:cooking_app/widgets/home_widgets/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/discover";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
