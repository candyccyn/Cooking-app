import 'package:cooking_app/view_models/menu_provider.dart';
import 'package:cooking_app/widgets/category_widgets/categoryBody.dart';
import 'package:cooking_app/widgets/category_widgets/categoryHeader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  static String routeName = "/category";

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            CategoryHeader(),
            CategoryBody(textHeader: menuProvider.getPickCategory),
          ],
        ),
      ),
    );
  }
}
