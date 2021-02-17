import 'package:cooking_app/screens/authenticate/signin_screen.dart';
import 'package:cooking_app/screens/authenticate/signup_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
};
