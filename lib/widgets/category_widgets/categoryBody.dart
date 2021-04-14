import 'package:cooking_app/view_models/category_view_model.dart';
import 'package:cooking_app/view_models/menu_view_model.dart';
import 'package:cooking_app/widgets/category_widgets/categoryHeader.dart';
import 'package:cooking_app/widgets/home_widgets/categoriesCrad.dart';
import 'package:cooking_app/widgets/menu_card.dart';
import 'package:flutter/material.dart';

class CategoryBody extends StatelessWidget {
  MenuViewModel menuViewModel = MenuViewModel();
  CategoryViewModel categoryVM = CategoryViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            CategoryHeader(),
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
                            'Asian Food',
                            style: TextStyle(
                                fontFamily: 'Century Gothic',
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Color.fromRGBO(9, 29, 103, 1)),
                          ),
                          SizedBox(height: 40),
                          ...List.generate(menuViewModel.getMenuSize(),
                              (index) {
                            return Container(
                              child: MenuCard(
                                image: menuViewModel.getImg(index),
                                title: menuViewModel.getText(index),
                              ),
                            );
                          }),
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
