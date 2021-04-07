import 'package:cooking_app/models/menu.dart';
import 'package:cooking_app/view_models/category_view_model.dart';
import 'package:cooking_app/view_models/menu_view_model.dart';
import 'package:cooking_app/widgets/home_widgets/recommendCard.dart';
import 'package:cooking_app/widgets/home_widgets/search_bar.dart';
import 'package:cooking_app/widgets/home_widgets/categoriesCrad.dart';
import 'package:flutter/material.dart';
import 'categoriesCrad.dart';
import 'homeHeader.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var _crossAxisSpacing = 20;
    var _screenWidth = MediaQuery.of(context).size.width;
    var _crossAxisCount = 2;
    var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var cellHeight = 80;
    var _aspectRatio = _width / cellHeight;

    CategoryViewModel categoryVM = CategoryViewModel();
    MenuViewModel menuViewModel = MenuViewModel();

    return Scaffold(
        body: Container(
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HomeHeader(),
                      SizedBox(height: 10),
                      SearchBar(),
                      SizedBox(height: 10),
                      Container(
                        // decoration: BoxDecoration(color: Colors.pink),
                        height: size.height * .10,
                        child: Row(
                          children: [
                            Text(
                              'Categories',
                              style: TextStyle(
                                  fontFamily: 'Century Gothic',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromRGBO(9, 29, 103, 1)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                          // decoration: BoxDecoration(color: Colors.green),
                          height: size.height * .22,
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: _aspectRatio,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              children: List.generate(
                                  categoryVM.getCategorySize(), (index) {
                                return Container(
                                  child: CategoryCard(
                                    image: categoryVM.getImg(index),
                                    title: categoryVM.getText(index),
                                  ),
                                );
                              }),
                            ),
                          )),
                      SizedBox(height: 10),
                      Container(
                        // decoration: BoxDecoration(color: Colors.pink),
                        height: size.height * .10,
                        child: Row(
                          children: [
                            Text(
                              'Recommended Recipe',
                              style: TextStyle(
                                  fontFamily: 'Century Gothic',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromRGBO(9, 29, 103, 1)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      RecommendCard(),
                      SizedBox(height: 10)
                    ],
                  ),
                )
            )
        )
    );
  }
}
