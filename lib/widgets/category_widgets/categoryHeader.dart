import 'package:cooking_app/screens/home/home.dart';
import 'package:cooking_app/services/menu_service.dart';
import 'package:cooking_app/services/menu_service.dart';

import 'package:cooking_app/view_models/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryHeader extends StatelessWidget {
  final String category;
  @override
  const CategoryHeader({
    Key key,
    this.category,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    final menus = menuProvider.getCategory;
    final imagePath =
        findImagePathfromCategory(menus, menuProvider.getPickCategory);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height * 0.35,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new NetworkImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_rounded, size: 30),
        backgroundColor: Colors.black54.withOpacity(0.5),
        onPressed: () {
          Navigator.pop(context);
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
      ),
    );
  }
}
