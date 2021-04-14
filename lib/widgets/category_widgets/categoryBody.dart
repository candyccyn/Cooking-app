import 'package:cooking_app/view_models/menu_view_model.dart';
import 'package:cooking_app/widgets/category_widgets/categoryHeader.dart';
import 'package:cooking_app/widgets/menu_card.dart';
import 'package:flutter/material.dart';

class CategoryBody extends StatelessWidget {

  MenuViewModel menuViewModel = MenuViewModel();
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
                    height: 800,
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
                          Container(
                            decoration: BoxDecoration(color: Colors.green),
                              child: MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: GridView.count(
                                  crossAxisCount: 2,
                                  // crossAxisSpacing: 20,
                                  // mainAxisSpacing: 20,
                                  children: List.generate(
                                      MenuCard.getMenuSize(), (index) {
                                    return Container(
                                      child: MenuCard(
                                        image: menuViewModel.getImg(index),
                                        title: menuViewModel.getText(index),
                                      ),
                                    );
                                  }),
                                ),
                              )),
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
