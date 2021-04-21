import 'package:cooking_app/widgets/bookmark_widgets/bookmarkHeader.dart';
import 'package:cooking_app/widgets/category_widgets/categoryBody.dart';
import 'package:cooking_app/widgets/category_widgets/categoryHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookmarkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            BookmarkHeader(),
            CategoryBody(textHeader: ""),
          ],
        ),
      ),
    );
  }
}
