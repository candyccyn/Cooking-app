import 'package:cooking_app/models/menu.dart';
import 'package:cooking_app/services/bookmark_service.dart';
import 'package:cooking_app/view_models/menu_provider.dart';
import 'package:cooking_app/widgets/bookmark_widgets/bookmarkHeader.dart';
import 'package:cooking_app/widgets/category_widgets/categoryBody.dart';
import 'package:cooking_app/widgets/category_widgets/categoryHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class BookmarkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    BookmarkService bookmarkService = BookmarkService(menuProvider.getUid);
    Future<List<Menu>> bookmarkData = bookmarkService.getBookmarkMenu();

    bookmarkData.then((value) => menuProvider.setBookmarkData(value));
    List<Menu> bookmarkMenu = menuProvider.getBookmarkData;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            BookmarkHeader(),
            CategoryBody(textHeader: "", menus: bookmarkMenu),
          ],
        ),
      ),
    );
  }
}
