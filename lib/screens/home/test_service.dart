import 'package:cooking_app/services/auth.dart';
import 'package:cooking_app/services/bookmark_service.dart';
import 'package:cooking_app/services/dataTransfer.dart';
import 'package:cooking_app/services/menu_detail_service.dart';
import 'package:cooking_app/services/menu_service.dart';
import 'package:cooking_app/services/post_services/bookmark_post_service.dart';
import 'package:cooking_app/services/post_services/menu_post.dart';
import 'package:cooking_app/services/post_services/user_detail_post.dart';
import 'package:cooking_app/services/user_detail.dart';
import 'package:flutter/material.dart';

class TestServiceScreen extends StatefulWidget {
  static String routeName = "/test_service";

  @override
  _TestServiceScreenState createState() => _TestServiceScreenState();
}

class _TestServiceScreenState extends State<TestServiceScreen> {
  DataTransfer d = DataTransfer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test App'),
      ),
      body: Center(child: Text('Service Test')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var data = await d.getAsianFood('Asian Potsticker Soup', 12, 5);
          await d.transferCollection(data);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
