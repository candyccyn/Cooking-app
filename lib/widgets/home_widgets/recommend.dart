import 'package:cooking_app/models/menu.dart';
import 'package:cooking_app/services/menu_service.dart';
import 'package:cooking_app/view_models/menu_provider.dart';
import 'package:cooking_app/widgets/menu_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecommendCard extends StatelessWidget {
  MenuService menuService = MenuService();

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    Future<List<Menu>> recommendedMenu =
        menuService.getAllMenu();

    recommendedMenu.then((value) => menuProvider.setRecommended(value));

    List<Menu> menus = menuProvider.getRecommendedMenu;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(menus.length, (index) {
            return Container(
              // decoration: BoxDecoration(color: Colors.lightGreenAccent),
              padding: EdgeInsets.only(right: 20),
              // ignore: missing_required_param
              child: MenuCard(
                imagePath: menus[index].imagePath,
                title: menus[index].menuName,
                menuOwner: menus[index].menuOwner
              ),
            );
          })),
    );
  }
}
