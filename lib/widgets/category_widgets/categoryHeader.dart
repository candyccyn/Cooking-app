import 'package:cooking_app/screens/home/home.dart';
import 'package:cooking_app/view_models/category_header_view_model.dart';
import 'package:flutter/material.dart';

class CategoryHeader extends StatelessWidget {
  CategoryHeaderViewModel categoryHeaderViewModel = CategoryHeaderViewModel();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height * 0.35,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage(categoryHeaderViewModel.getImg(0)),
            fit: BoxFit.cover,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_rounded, size: 30),
        backgroundColor: Colors.black54.withOpacity(0.5),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
      ),
    );
  }
}
