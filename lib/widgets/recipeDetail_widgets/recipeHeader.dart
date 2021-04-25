import 'package:cooking_app/screens/category/category.dart';
import 'package:cooking_app/services/bookmark_service.dart';
import 'package:cooking_app/services/menu_detail_service.dart';
import 'package:cooking_app/services/menu_service.dart';
import 'package:cooking_app/services/post_services/bookmark_post_service.dart';
import 'package:cooking_app/view_models/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeDetailHeader extends StatefulWidget {
  const RecipeDetailHeader({
    Key key,
    this.menuName,
    this.imagePath,
    this.hasBeenPressed,
  }) : super(key: key);

  final String menuName, imagePath;
  final bool hasBeenPressed;

  @override
  _RecipeDetailHeaderState createState() => _RecipeDetailHeaderState(
      this.imagePath, this.menuName, this.hasBeenPressed);
}

class _RecipeDetailHeaderState extends State<RecipeDetailHeader> {
  String imagePath, menuName;
  bool hasBeenPressed;
  _RecipeDetailHeaderState(
      String imagePath, String menuName, bool hasBeenPressed) {
    this.imagePath = imagePath;
    this.menuName = menuName;
    this.hasBeenPressed = hasBeenPressed;
  }
  //bool _hasBeenPressed = false;
  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    print(this.hasBeenPressed);
    MenuService mS = MenuService();
    MenuDetailService mD = MenuDetailService("None");
    BookmarkService bS = BookmarkService(menuProvider.getUid);
    BookmarkPost bP = BookmarkPost(menuProvider.getUid);

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height * 0.35,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new NetworkImage(this.imagePath.toString()),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
                height: 44,
                child: Container(
                  decoration: ShapeDecoration(
                    color: Color.fromRGBO(255, 161, 50, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30))),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.bookmark_rounded),
                    color: hasBeenPressed
                        ? Color.fromRGBO(9, 29, 103, 1)
                        : Colors.white,
                    onPressed: () async {
                      if (!hasBeenPressed) {
                        await bP.addBookmark(menuName, imagePath);
                      } else {
                        await bP.removeBookmark(menuName);
                      }
                      setState(() {
                        hasBeenPressed = !hasBeenPressed;
                      });
                    },
                  ),
                )),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_rounded, size: 30),
        backgroundColor: Colors.black54.withOpacity(0.5),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
