import 'package:cooking_app/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';


class SignInScreen extends StatelessWidget {
  static String routeName="/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SignIn(),
      
    );
    
  }
}