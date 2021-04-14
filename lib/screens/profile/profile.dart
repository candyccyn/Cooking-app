import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/services/user_detail.dart';
import 'package:cooking_app/view_models/menu_provider.dart';

import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);

    return Text(menuProvider.getUsername);
  }
}
