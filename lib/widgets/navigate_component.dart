import 'package:cooking_app/screens/bookmarks/bookmarks.dart';
import 'package:cooking_app/screens/profile/profile.dart';
import 'package:cooking_app/screens/home/home.dart';
import 'package:cooking_app/view_models/navigaition_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyStatefulWidget extends StatefulWidget {
  //const MyStatefulWidget({Key? key}) : super(key: key);
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var currentTab = [
    BookmarkScreen(),
    HomeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var navProvider = Provider.of<NavigationBarProvider>(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Hello'),
      //   backgroundColor: Colors.orange,
      // ),
      body: currentTab[navProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              title: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: SizedBox.shrink(),
            ),
          ],
          currentIndex: navProvider.currentIndex,
          selectedItemColor: Color.fromRGBO(9, 29, 103, 1),
          unselectedItemColor: Colors.white,
          onTap: (index) {
            navProvider.currentIndex = index;
          },
          backgroundColor: Color.fromRGBO(255, 161, 50, 1)),
    );
  }
}
