import 'package:cloud_firestore/cloud_firestore.dart';
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
          // var data = await d.getAsianFood('Spaghetti and Meatballs', 14, 5);
          // await d.transferCollection(data);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

Future<void> testFn() async {
  CollectionReference _menuReference =
  FirebaseFirestore.instance.collection('test2');

  QuerySnapshot querySnapshot =
  await _menuReference.where('name', isEqualTo: 'Pasta').get();

  var menuId = querySnapshot.docs[0].id;

  _menuReference.doc(menuId).collection('steps').orderBy('order').get()
  .then((value) => value.docs.forEach((element) {
    print(element.data()['text']);
  }));
}

