import 'package:cooking_app/routes.dart';
import 'package:cooking_app/screens/recipe/add_recipe.dart';
import 'package:cooking_app/screens/welcome/welcome.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async {
  // Initialize firebase products
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Poppins",),
      routes: routes,
      home: AddRecipeScreen(),
    //  initialRoute: WelcomeScreen.routeName,
    );
  }
}

