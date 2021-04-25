import 'package:cooking_app/models/menu.dart';
import 'package:cooking_app/services/bookmark_service.dart';
import 'package:cooking_app/view_models/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.35,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/cooking-app-447bb.appspot.com/o/Group%2020.png?alt=media&token=37999930-62ad-4441-a1f8-96ad89998392"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 41, top: 90),
                  child: Text(
                    'Bookmark',
                    style: TextStyle(
                        fontFamily: 'Century Gothic',
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.white),
                  ))),
          Container(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 41, top: 128),
                  child: Text(
                    'Enjoy! Your favorite recipes',
                    style: TextStyle(
                        fontFamily: 'Century Gothic',
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                        fontSize: 17,
                        color: Colors.white),
                  ))),
        ],
      ),
    ));
  }
}
