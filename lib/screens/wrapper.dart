import 'package:cooking_app/screens/authenticate/authenticate.dart';
import 'package:cooking_app/screens/authenticate/signIn_screen.dart';
import 'package:cooking_app/screens/authenticate/sign_in.dart';
import 'package:cooking_app/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// This class was built for checking
// whether the user has logged in
    // if not -> send the user to authenticate screen
// otherwise -> home
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignUpScreen();
  }
}
