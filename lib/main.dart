import 'package:cooking_app/routes.dart';
import 'package:cooking_app/screens/main/main_screen.dart';
import 'package:cooking_app/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

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
      home: Wrapper(),
      theme: ThemeData(fontFamily: "Poppins",),
      routes: routes,
      initialRoute: MainScreen.routeName,
    );
  }
}

