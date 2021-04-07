import 'package:cooking_app/widgets/category_widgets/categoryBody.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  static String routeName = "/category";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CategoryBody(),
    );
  }
}