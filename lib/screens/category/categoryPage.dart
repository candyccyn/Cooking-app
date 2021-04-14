import 'package:cooking_app/view_models/menu_provider.dart';

import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  static String routeName = "/category";

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);

    return Text(menuProvider.getPickCategory);
  }
}
