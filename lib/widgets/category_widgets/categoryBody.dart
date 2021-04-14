import 'package:cooking_app/models/menu.dart';
import 'package:cooking_app/services/menu_service.dart';
import 'package:cooking_app/view_models/menu_provider.dart';
import 'package:cooking_app/view_models/menu_view_model.dart';
import 'package:cooking_app/widgets/category_widgets/categoryHeader.dart';
import 'package:cooking_app/widgets/menu_card.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryBody extends StatelessWidget {
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
            CategoryHeader(category: menuProvider.getPickCategory),
            DraggableScrollableSheet(
              maxChildSize: 1,
              initialChildSize: 0.7,
              minChildSize: 0.7,
              builder: (context, controller) {
                return SingleChildScrollView(
                  controller: controller,
                  child: Container(
                    height: 2000,
                    // padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            menuProvider.getPickCategory,
                            style: TextStyle(
                                fontFamily: 'Century Gothic',
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Color.fromRGBO(9, 29, 103, 1)),
                          ),
                          SizedBox(height: 40),
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
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
