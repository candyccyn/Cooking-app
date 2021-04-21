import 'package:cooking_app/screens/Timer/step_timer.dart';
import 'package:cooking_app/screens/authenticate/sign_in.dart';
import 'package:cooking_app/screens/authenticate/sign_up.dart';

import 'package:cooking_app/screens/recipe/add_recipe_page.dart';
import 'package:cooking_app/screens/category/category.dart';

import 'package:cooking_app/screens/home/home.dart';
import 'package:cooking_app/screens/home/test_service.dart';

import 'package:cooking_app/screens/recipe_detail/recipeDetailPage.dart';

import 'package:cooking_app/screens/profile/edit_profile.dart';

import 'package:cooking_app/screens/welcome/welcome.dart';
import 'package:cooking_app/screens/profile/profile.dart';
import 'screens/home/home.dart';

import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  EditProfileScreen.routeName: (context) => EditProfileScreen(),
  AddRecipeScreen.routeName: (context) => AddRecipeScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  TimerScreen.routeName: (context) => TimerScreen(),
  CategoryScreen.routeName: (context) => CategoryScreen(),
  TestServiceScreen.routeName: (context) => TestServiceScreen(),
  RecipeDetailScreen.routeName: (context) => RecipeDetailScreen(),
};
