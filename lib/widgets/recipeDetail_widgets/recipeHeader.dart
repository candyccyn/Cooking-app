import 'package:cooking_app/screens/category/category.dart';
import 'package:flutter/material.dart';

class RecipeDetailHeader extends StatefulWidget {
  const RecipeDetailHeader({
    Key key,
    this.imagePath,
  }) : super(key: key);

  final String imagePath;

  @override
  _RecipeDetailHeaderState createState() =>
      _RecipeDetailHeaderState(this.imagePath);
}

class _RecipeDetailHeaderState extends State<RecipeDetailHeader> {
  String imagePath;
  _RecipeDetailHeaderState(String imagePath) {
    this.imagePath = imagePath;
  }

  bool _hasBeenPressed = false;
  @override
  Widget build(BuildContext context) {
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
                    color: _hasBeenPressed
                        ? Color.fromRGBO(9, 29, 103, 1)
                        : Colors.white,
                    onPressed: () {
                      setState(() {
                        _hasBeenPressed = !_hasBeenPressed;
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
