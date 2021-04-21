import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cooking_app/widgets/recipe/add/add_recipe.dart';
import 'package:cooking_app/services/user_detail.dart';
import 'package:cooking_app/view_models/provider_viewmodel.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class AddRecipeScreen extends StatefulWidget {
  static String routeName = "/add_recipe";

  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return AddStep();
  }
}
