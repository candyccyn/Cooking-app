import 'package:cooking_app/models/menu.dart';
import 'package:cooking_app/services/menu_service.dart';
import 'package:cooking_app/view_models/menu_provider.dart';
import 'package:cooking_app/view_models/menu_view_model.dart';
import 'package:cooking_app/widgets/category_widgets/categoryHeader.dart';
import 'package:cooking_app/widgets/menu_card.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryBody extends StatelessWidget {
  final String textHeader;
  final List<Menu> menus;

  CategoryBody({
    Key key,
    this.textHeader,
    this.menus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _crossAxisSpacing = 30;
    var _screenWidth = MediaQuery.of(context).size.width;
    var _crossAxisCount = 2;
    var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var cellHeight = 295;
    var _aspectRatio = _width / cellHeight;

    return DraggableScrollableSheet(
      maxChildSize: 1,
      initialChildSize: 0.7,
      minChildSize: 0.7,
      builder: (context, controller) {
        return SingleChildScrollView(
          controller: controller,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: double.infinity,
            ),
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
                    textHeader,
                    style: TextStyle(
                        fontFamily: 'Century Gothic',
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color.fromRGBO(9, 29, 103, 1)),
                  ),
                  SizedBox(height: 40),
                  Container(
                    // decoration: BoxDecoration(color: Colors.pink),
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 20,
                        childAspectRatio: _aspectRatio,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: List.generate(this.menus.length, (index) {
                          return Container(
                            // ignore: missing_required_param
                            child: MenuCard(
                              imagePath: this.menus[index].imagePath.toString(),
                              title: this.menus[index].menuName.toString(),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
