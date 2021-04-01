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
      appBar: AppBar(
        title: const Text('Hello'),
      ),
      body: currentTab[navProvider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Discover',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.orange,
          ),
        ],
        currentIndex: navProvider.currentIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          navProvider.currentIndex = index;
        },
      ),
    );
  }
}
