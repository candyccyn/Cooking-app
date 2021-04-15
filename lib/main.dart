import 'package:cooking_app/routes.dart';
import 'package:cooking_app/screens/authenticate/sign_in.dart';
import 'package:cooking_app/screens/home/home.dart';
import 'package:cooking_app/screens/home/test_service.dart';
import 'package:cooking_app/screens/profile/profile.dart';
import 'package:cooking_app/screens/recipe_detail/recipeDetailPage.dart';
import 'package:cooking_app/screens/welcome/welcome.dart';
import 'package:cooking_app/view_models/navigaition_bar_provider.dart';
import 'package:cooking_app/widgets/navigate_component.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home/home.dart';

void main() async {
  // Initialize firebase products
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  // const MyApp({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      routes: routes,
      initialRoute: RecipeDetailScreen.routeName,
      // home: ChangeNotifierProvider<NavigationBarProvider>(
      //   child: MyStatefulWidget(),
      //   create: (BuildContext context) => NavigationBarProvider(),
      // ),
    );
  }
}
