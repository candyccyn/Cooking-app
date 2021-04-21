import 'package:cooking_app/models/category_data.dart';
import 'package:cooking_app/services/menu_service.dart';
import 'package:cooking_app/view_models/menu_provider.dart';
import 'package:cooking_app/widgets/home_widgets/recommend.dart';
import 'package:cooking_app/widgets/home_widgets/search_bar.dart';
import 'package:cooking_app/widgets/home_widgets/category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'category.dart';
import 'header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CategoryService categoryService = CategoryService();

    var size = MediaQuery.of(context).size;
    var _crossAxisSpacing = 20;
    var _screenWidth = MediaQuery.of(context).size.width;
    var _crossAxisCount = 2;
    var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var cellHeight = 80;
    var _aspectRatio = _width / cellHeight;

    final menuProvider = Provider.of<MenuProvider>(context);
    Future<List<Category>> allCategories = categoryService.getAllCategories();
    allCategories.then((categories) => menuProvider.setCategory(categories));
    List<Category> categories = menuProvider.getCategory;

    return Scaffold(
        body: Container(
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Header(username: menuProvider.getUsername),
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
                                  fontFamily: 'Poppins',
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
                                children: [
                                  ...List.generate(categories.length, (index) {
                                    return Container(
                                      child: CategoryCard(
                                        image: categories[index].imagePath,
                                        title: categories[index].categoryName,
                                      ),
                                    );
                                  }),
                                ]),
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
                ))));
  }
}
