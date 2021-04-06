import 'package:cooking_app/view_models/menu_view_model.dart';
import 'package:cooking_app/widgets/menu_card.dart';
import 'package:flutter/material.dart';

class RecommendCard extends StatelessWidget {
  MenuViewModel menuViewModel = MenuViewModel();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(menuViewModel.getMenuSize(), (index) {
            return Container(
              child: MenuCard(
                image: menuViewModel.getImg(index),
                title: menuViewModel.getText(index),
              ),
            );
          }),
        ],
      ),
    );
  }
}
