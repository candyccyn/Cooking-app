import 'package:cooking_app/models/menu.dart';
import 'package:cooking_app/services/menu_service.dart';
import 'package:cooking_app/widgets/menu_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecommendCard extends StatelessWidget {
  MenuService menuService = MenuService();

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    Future<List<Menu>> recommendedMenu =
        menuService.getMenuByFilter("Asian Food");

    recommendedMenu.then((value) => menuProvider.setRecommended(value));

    List<Menu> menus = menuProvider.getRecommendedMenu;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(menus.length, (index) {
            return Container(
              // ignore: missing_required_param
              child: MenuCard(
                imagePath: menus[index].imagePath,
                title: menus[index].menuName,
              ),
            );
          })
        ],
      ),
    );
  }
}
