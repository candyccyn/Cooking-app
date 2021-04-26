import 'package:cooking_app/widgets/recipe/add/add_form.dart';
import 'package:cooking_app/widgets/recipe/add/step_form.dart';
import 'package:cooking_app/widgets/shared/roundedbutton.dart';
import 'package:flutter/material.dart';

class AddStep extends StatefulWidget {
  _AddStepState createState() => _AddStepState();
}

@override
class _AddStepState extends State<AddStep> {
  // TODO: implement createState
  int countStep = 1;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        textTheme: TextTheme(
            headline6: TextStyle(fontFamily: "Century Gothic",color: Color(0xff091D67), fontSize: 18)),
        title: Text("Add New Recipe",
            style: TextStyle(fontFamily: "Century Gothic",
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xffFFA132),
          iconSize: 20.0,
          onPressed: () {
            Navigator.pop(context);
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
                Text("Steps",
                    style: TextStyle(fontFamily: "Century Gothic",
                        color: Color(0xff7C7C7C), fontWeight: FontWeight.bold)),
                ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    shrinkWrap: true,
                    itemCount: countStep,
                    itemBuilder: (BuildContext context, int index) {
                      return StepForm(countStep.toString());
                    }),
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
                      onPressed: () {
                        setState(() {
                          countStep += 1;
                        });
                      },
                      child: Text(
                        "+ Add more step",
                        style:
                            TextStyle(fontFamily: "Century Gothic",fontSize: 15, color: Color(0xffFFA132)),
                      )),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: SizedBox(
                    width: double.infinity,
                    height: 34,
                    child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Color(0xFFFFB448),
                        onPressed: () {},
                        child: Text(
                          "Save",
                          style: TextStyle(fontFamily: "Century Gothic",fontSize: 15, color: Colors.white),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
