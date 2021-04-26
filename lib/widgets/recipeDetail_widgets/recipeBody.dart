import 'package:cooking_app/models/ingredient.dart';
import 'package:cooking_app/models/menu_detail_data.dart';
import 'package:cooking_app/models/review.dart';
import 'package:cooking_app/models/step.dart';
import 'package:cooking_app/services/menu_detail_service.dart';
import 'package:cooking_app/view_models/menu_provider.dart';
import 'package:cooking_app/widgets/recipeDetail_widgets/breif_info.dart';
import 'package:cooking_app/widgets/recipeDetail_widgets/clock_button.dart';
import 'package:cooking_app/widgets/recipeDetail_widgets/comment_bar.dart';
import 'package:cooking_app/widgets/recipeDetail_widgets/recipeHeader.dart';
import 'package:cooking_app/widgets/recipeDetail_widgets/reviewPost.dart';
import 'package:cooking_app/widgets/recipeDetail_widgets/steps.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ingredients.dart';

class RecipeBody extends StatefulWidget {
  String type, imagePath;
  RecipeBody({Key key, this.type, this.imagePath}) : super(key: key);

  @override
  _RecipeBodyState createState() => _RecipeBodyState(type, imagePath);
}

class _RecipeBodyState extends State<RecipeBody> {
  String type, imagePath;
  _RecipeBodyState(String type, String imagePath) {
    this.type = type;
    this.imagePath = imagePath;
  }

  @override
  Widget build(BuildContext context) {
    var _crossAxisSpacing = 30;
    var _screenWidth = MediaQuery.of(context).size.width;
    var _crossAxisCount = 2;
    var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var cellHeight = 295;
    var _aspectRatio = _width / cellHeight;
    var size = MediaQuery.of(context).size;
    final menuProvider = Provider.of<MenuProvider>(context);

    MenuDetailService menuDetailService =
        MenuDetailService(menuProvider.getPickReciepe);

    String allTime = menuProvider.setAlltime(menuProvider.getStepList);

    Future<List<Ingredient>> ingredientList =
        menuDetailService.fetchIngredient();

    Future<List<Steps>> stepList = menuDetailService.fetchStep();
    Future<String> menuType = menuDetailService.fetchMenuType();

    Future<List<Review>> reviewList = menuDetailService.fetchReview();

    ingredientList.then((value) => menuProvider.setIngredientList(value));

    reviewList.then((value) => menuProvider.setReviewList(value));
    stepList.then((value) => menuProvider.setStepList(value));

    menuType.then((value) => menuProvider.setMenuType(value));

    bool hasBeenPressed = menuProvider.isSetBookmark(
        menuProvider.getPickReciepe, menuProvider.getBookmarkData);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            RecipeDetailHeader(
                imagePath: menuProvider.getMenuImagePath,
                menuName: menuProvider.getPickReciepe,
                hasBeenPressed: hasBeenPressed),
            DraggableScrollableSheet(
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
                          Text(menuProvider.getPickReciepe,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(9, 29, 103, 1))),
                          SizedBox(height: 5),
                          Text('by ' + menuProvider.getMenuOwner,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(255, 149, 24, 0.89))),
                          SizedBox(height: 20),
                          BreifInfo(
                            type: menuProvider.getMenuType,
                            time: allTime + " MINS",
                            ingredient: menuProvider.getIngredientList.length
                                    .toString() +
                                " Ingredients",
                          ),
                          Heading(text: 'Ingredients'),
                          ...List.generate(
                              menuProvider.getIngredientList.length, (index) {
                            return Container(
                              child: Ingredients(
                                name: menuProvider.getIngredientList[index].name
                                    .toString(),
                                amount: menuProvider
                                    .getIngredientList[index].amount
                                    .toString(),
                                gram: menuProvider
                                    .getIngredientList[index].units
                                    .toString(),
                              ),
                            );
                          }),
                          Row(
                            children: [
                              Heading(text: 'Steps'),
                              Spacer(),
                              ClockButton(),
                              SizedBox(width: 20),
                            ],
                          ),
                          ...List.generate(menuProvider.getStepList.length,
                              (index) {
                            return Container(
                              child: Stepps(
                                number: index + 1,
                                description: menuProvider
                                    .getStepList[index].text
                                    .toString(),
                                time: menuProvider.getStepList[index].time
                                    .toString(),
                                unit: menuProvider.getStepList[index].unit
                                    .toString(),
                              ),
                            );
                          }),
                          Heading(text: 'Reviews'),
                          ...List.generate(menuProvider.getReviewList.length,
                              (index) {
                            return Container(
                              child: ReviewPost(
                                  description: menuProvider
                                      .getReviewList[index].text
                                      .toString(),
                                  username: menuProvider
                                      .getReviewList[index].reviewer
                                      .toString()
                                  // image: reviewsViewModel.getImage(index),
                                  ),
                            );
                          }),
                          CommentBar(),
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

class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 10.0,
      width: 10.0,
      decoration: new BoxDecoration(
        color: Color.fromRGBO(255, 149, 24, 0.89),
        shape: BoxShape.rectangle,
      ),
    );
  }
}

class Heading extends StatelessWidget {
  const Heading({
    Key key,
    this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      // decoration: BoxDecoration(color: Colors.green),
      height: size.height * .1,
      child: Row(
        children: [
          MyBullet(),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
                fontFamily: 'Century Gothic',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color.fromRGBO(9, 29, 103, 1)),
          ),
        ],
      ),
    );
  }
}
