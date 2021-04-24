import 'package:cooking_app/services/bookmark_service.dart';
import 'package:cooking_app/services/menu_detail_service.dart';
import 'package:cooking_app/services/menu_service.dart';
import 'package:flutter/material.dart';

class TestServiceScreen extends StatefulWidget {
  static String routeName = "/test_service";

  @override
  _TestServiceScreenState createState() => _TestServiceScreenState();
}

class _TestServiceScreenState extends State<TestServiceScreen> {
  MenuService mS = MenuService();
  MenuDetailService mD = MenuDetailService("None");
  BookmarkService bS = BookmarkService('jRzSrUo6SVOcPZshFEEDyuTgc4i1');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      body: Center(child: Text('You have pressed the button x times.')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await bS.testFn();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
