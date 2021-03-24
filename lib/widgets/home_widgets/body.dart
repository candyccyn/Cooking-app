import 'package:cooking_app/screens/welcome/welcome.dart';
import 'package:cooking_app/widgets/home_widgets/search_bar.dart';
import 'package:cooking_app/widgets/home_widgets/category.dart';
import 'package:flutter/material.dart';
import 'header.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var _crossAxisSpacing = 20;
    var _screenWidth = MediaQuery.of(context).size.width;
    var _crossAxisCount = 2;
    var _width = ( _screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) / _crossAxisCount;
    var cellHeight = 80;
    var _aspectRatio = _width /cellHeight;

    return Scaffold(
        body: Container(
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Header(),
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
                        crossAxisCount: _crossAxisCount,
                        childAspectRatio: _aspectRatio,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: <Widget>[
                          CategoryCard(
                            title: "Asian Food",
                                    pngSrc: "assets/images/noodle.png",
                                    press: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) {
                                          return WelcomeScreen();
                                        }),
                                      );
                                    },
                          ),
                        CategoryCard(
                                  title: "European Food",
                                  pngSrc: "assets/images/steak.png",
                                  press: () {},
                        ),
                        CategoryCard(
                                  title: "Drinks",
                                  pngSrc: "assets/images/drink.png",
                                  press: () {},
                                ),
                          CategoryCard(
                                  title: "Desserts",
                                  pngSrc: "assets/images/cake.png",
                                  press: () {},
                          ),

                        ],
                      ),
                    )
                  )

                      // Expanded(
                      //   child: GridView.count(
                      //     crossAxisCount: 2,
                      //     childAspectRatio: .85,
                      //     crossAxisSpacing: 20,
                      //     mainAxisSpacing: 20,
                      //     children: <Widget>[
                      //       CategoryCard(
                      //         title: "Asian Food",
                      //         svgSrc: "assets/images/noodle.png",
                      //         press: () {},
                      //       ),
                      //       CategoryCard(
                      //         title: "European Food",
                      //         svgSrc: "assets/images/steak.png",
                      //         press: () {},
                      //       ),
                      //       CategoryCard(
                      //         title: "Drink",
                      //         svgSrc: "assets/images/noodle.png",
                      //         press: () {},
                      //       ),
                      //       CategoryCard(
                      //         title: "Desserts",
                      //         svgSrc: "assets/images/cake.png",
                      //         press: () {},
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                )
            )
        )
    );
  }
}
