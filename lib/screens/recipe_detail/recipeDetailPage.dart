import 'package:cooking_app/view_models/menu_provider.dart';
import 'package:cooking_app/widgets/recipeDetail_widgets/recipeBody.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecipeDetailScreen extends StatelessWidget {
  static String routeName = "/recipe";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RecipeBody(),
    );
  }
}
