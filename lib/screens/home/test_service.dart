import 'package:cooking_app/services/bookmark_service.dart';
import 'package:cooking_app/services/menu_detail_service.dart';
import 'package:cooking_app/services/menu_service.dart';
import 'package:cooking_app/services/post_services/bookmark_post_service.dart';
import 'package:cooking_app/services/post_services/user_detail_post.dart';
import 'package:cooking_app/services/user_detail.dart';
import 'package:flutter/material.dart';

class TestServiceScreen extends StatefulWidget {
  static String routeName = "/test_service";

  @override
  _TestServiceScreenState createState() => _TestServiceScreenState();
}

class _TestServiceScreenState extends State<TestServiceScreen> {
  // MenuService mS = MenuService();
  // MenuDetailService mD = MenuDetailService("None");
  // BookmarkService bS = BookmarkService('jRzSrUo6SVOcPZshFEEDyuTgc4i1');
  // BookmarkPost bP = BookmarkPost('jRzSrUo6SVOcPZshFEEDyuTgc4i1');
  UserDetailService uS = UserDetailService('jRzSrUo6SVOcPZshFEEDyuTgc4i1');
  UserDetailPost uP = UserDetailPost('jRzSrUo6SVOcPZshFEEDyuTgc4i1');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test App'),
      ),
      body: Center(child: Text('Service Test')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await uP.updateUserImage('from update!');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
