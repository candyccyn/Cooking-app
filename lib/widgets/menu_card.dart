import 'package:cooking_app/models/menu.dart';
import 'package:cooking_app/screens/recipe_detail/recipeDetailPage.dart';
import 'package:cooking_app/view_models/menu_provider.dart';
import 'package:cooking_app/widgets/recipeDetail_widgets/recipeBody.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuCard extends StatelessWidget {
  final String imagePath, menuOwner;
  final String title;
  final Function press;

  const MenuCard({
    Key key,
    this.imagePath,
    this.title,
    this.menuOwner,
    this.press,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.menu,
  }) : super(key: key);

  final double width, aspectRetio;
  final Menu menu;

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    return Padding(
      padding: EdgeInsets.zero,
      child: SizedBox(
        width: width,
        child: GestureDetector(
          onTap: () {
            menuProvider.setPickedRecipe(title);
            menuProvider.setMenuOwner(menuOwner);
            menuProvider.setMenuImagePath(imagePath);
            Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) =>
                      new RecipeBody(type: menuOwner, imagePath: imagePath)),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(width),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imagePath.toString()),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              Text(
                title,
                style: TextStyle(
                    fontFamily: 'Century Gothic',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Color.fromRGBO(9, 29, 103, 1)),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Text(
                "by " + menuOwner,
                style: TextStyle(
                    fontFamily: 'Century Gothic',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Color.fromRGBO(255, 149, 24, 0.89)),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              // Row(
              //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     // InkWell(
              //     //   borderRadius: BorderRadius.circular(50),
              //     //   child: Container(
              //     //     padding: EdgeInsets.all(8),
              //     //     height: 50,
              //     //     width: 50,
              //     //     child: Icon(Icons.create),
              //     //   ),
              //     // ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
