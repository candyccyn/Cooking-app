import 'package:cooking_app/screens/authenticate/sign_in.dart';
import 'package:cooking_app/screens/authenticate/sign_up.dart';
import 'package:cooking_app/screens/category/categoryPage.dart';
import 'package:cooking_app/screens/home/home.dart';
import 'package:cooking_app/screens/home/test_service.dart';
import 'package:cooking_app/screens/recipe_detail/recipeDetailPage.dart';
import 'package:cooking_app/screens/welcome/welcome.dart';
import 'package:cooking_app/screens/profile/profile.dart';
import 'screens/home/home.dart';

import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  CategoryScreen.routeName: (context) => CategoryScreen(),
  TestServiceScreen.routeName: (context) => TestServiceScreen(),
  RecipeDetailScreen.routeName: (context) => RecipeDetailScreen(),
};
