import 'package:cooking_app/services/menu_service.dart';
import 'package:flutter/material.dart';

class TestServiceScreen extends StatefulWidget {
  static String routeName = "/test_service";

  @override
  _TestServiceScreenState createState() => _TestServiceScreenState();
}

class _TestServiceScreenState extends State<TestServiceScreen> {
  MenuService mS = MenuService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      body: Center(child: Text('You have pressed the button x times.')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await mS.getMenuByFilter('asian-food');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
