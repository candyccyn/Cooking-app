import 'package:cooking_app/models/menu.dart';
import 'package:cooking_app/services/menu_service.dart';
import 'package:cooking_app/view_models/menu_provider.dart';
import 'package:cooking_app/widgets/category_widgets/categoryBody.dart';
import 'package:cooking_app/widgets/category_widgets/categoryHeader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  static String routeName = "/category";

  MenuService menuService = MenuService();
  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);

    Future<List<Menu>> recommendedMenu =
        menuService.getMenuByFilter(menuProvider.getPickCategory);

    recommendedMenu.then((value) => menuProvider.setPickedCategoryData(value));
    List<Menu> menus = menuProvider.getPickedCategoryData;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            CategoryHeader(),
            CategoryBody(
                textHeader: menuProvider.getPickCategory, menus: menus),
          ],
        ),
      ),
    );
  }
}
