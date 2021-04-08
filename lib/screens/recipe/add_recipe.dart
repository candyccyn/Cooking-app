import 'package:cooking_app/widgets/recipe/add/add_form.dart';
import 'package:cooking_app/widgets/recipe/add/step_form.dart';
import 'package:cooking_app/widgets/shared/roundedbutton.dart';
import 'package:flutter/material.dart';

class AddRecipeScreen extends StatelessWidget {
  static String routeName = "/add_recipe";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        textTheme: TextTheme(
            headline6: TextStyle(color: Color(0xff091D67), fontSize: 18)),
        title: Text("Add New Recipe",style: TextStyle(fontWeight: FontWeight.bold,)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xffFFA132),
          iconSize: 20.0,
          onPressed: () {
            // _goBack(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.0,
                ),
                AddFrom(),
                SizedBox(height: 20),
                Text("Steps", style: TextStyle(color: Color(0xff7C7C7C),fontWeight: FontWeight.bold)),
                StepForm(),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 34,
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                              style: BorderStyle.solid,
                              color: Color(0xffFFA132))),
                      color: Colors.white,
                      onPressed: () {},
                      child: Text(
                        "+ Add more step",
                        style:
                            TextStyle(fontSize: 15, color: Color(0xffFFA132)),
                      )),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 34,
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Color(0xFFFFB448),
                      onPressed: () {},
                      child: Text(
                        "Save",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
