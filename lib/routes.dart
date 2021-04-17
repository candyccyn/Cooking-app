import 'package:cooking_app/screens/authenticate/sign_in.dart';
import 'package:cooking_app/screens/authenticate/sign_up.dart';

import 'package:cooking_app/screens/recipe/add_recipe_page.dart';
import 'package:cooking_app/screens/welcome/welcome.dart';
import 'package:cooking_app/screens/profile/profile.dart';

import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  AddRecipeScreen.routeName: (context) => AddRecipeScreen(),
};
