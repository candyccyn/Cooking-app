import 'package:cooking_app/models/menu_detail_data.dart';
import 'package:cooking_app/models/review.dart';
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

class IngredientsData {
  List<Map<String, String>> data = [
    {"name": "Tok pok ki", "gram": "20 grams"},
    {"name": "Goshujang", "gram": "8 grams"},
  ];
}

class IngredientsViewModel {
  IngredientsData _item = IngredientsData();

  int getIngredientsSize() {
    return _item.data.length;
  }

  String getName(int index) {
    return _item.data[index]["name"];
  }

  String getGrams(int index) {
    return _item.data[index]["gram"];
  }
}

class StepsData {
  List<Map<String, String>> data = [
    {"description": "1. Boil Tok pok ki for ", "time": "10 minutes"},
    {"description": "2. Make Goshujang sauce for ", "time": "10 minutes"},
  ];
}

class StepsViewModel {
  StepsData _item = StepsData();

  int getStepsSize() {
    return _item.data.length;
  }

  String getName(int index) {
    return _item.data[index]["description"];
  }

  String getTimes(int index) {
    return _item.data[index]["time"];
  }
}

class ReviewsData {
  List<Map<String, String>> data = [
    {
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
          "Donec imperdiet nunc risus, ac rutrum enim sodales vitae. Aliquam condimentum lacinia lorem, "
          "id laoreet turpis commodo nec.",
      "username": "cooking mama",
      "image":
          "https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg"
    },
    {
      "description": "Very good",
      "username": "ornorn__",
      "image":
          "https://scontent.fbkk5-6.fna.fbcdn.net/v/t1.6435-9/98056120_2963912283657166_6163160628174258176_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeGz1WmYYz0ZvbZO9YWv4WOhHz8x5_9Bar0fPzHn_0FqvXY3q-BB1JCQeok9c4DYT_CJxfDAJZlKcNzTvcEE7ElU&_nc_ohc=7S1hyQFBtnMAX-sl-r6&_nc_ht=scontent.fbkk5-6.fna&oh=030b723bda6eba0835f83b22b2ce56ce&oe=60A1D4F0"
    },
  ];
}

class ReviewsViewModel {
  ReviewsData _item = ReviewsData();

  int getReviewsSize() {
    return _item.data.length;
  }

  String getUsername(int index) {
    return _item.data[index]["username"];
  }

  String getDescription(int index) {
    return _item.data[index]["description"];
  }

  String getImage(int index) {
    return _item.data[index]["image"];
  }
}

class RecipeBody extends StatefulWidget {
  @override
  _RecipeBodyState createState() => _RecipeBodyState();
}

class _RecipeBodyState extends State<RecipeBody> {
  IngredientsViewModel ingredientsViewModel = IngredientsViewModel();
  StepsViewModel stepsViewModel = StepsViewModel();
  ReviewsViewModel reviewsViewModel = ReviewsViewModel();

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

    Future<MenuDetail> menuDetail = menuDetailService.assignMenuData();

    menuDetail.then((value) => menuProvider.setMenuDetail(value));
    print(menuProvider.getReviewList);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            RecipeDetailHeader(),
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
                          BreifInfo(),
                          Heading(text: 'Ingredients'),
                          ...List.generate(
                              ingredientsViewModel.getIngredientsSize(),
                              (index) {
                            return Container(
                              child: Ingredients(
                                name: ingredientsViewModel.getName(index),
                                gram: ingredientsViewModel.getGrams(index),
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
                          ...List.generate(stepsViewModel.getStepsSize(),
                              (index) {
                            return Container(
                              child: Steps(
                                description: stepsViewModel.getName(index),
                                time: stepsViewModel.getTimes(index),
                              ),
                            );
                          }),
                          Heading(text: 'Reviews'),
                          ...List.generate(menuProvider.getReviewList.length,
                              (index) {
                            return Container(
                              child: ReviewPost(
                                description:
                                    menuProvider.getReviewList[index].text,
                                username: reviewsViewModel.getUsername(index),
                                image: reviewsViewModel.getImage(index),
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
