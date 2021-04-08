import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinbox/cupertino.dart';
import 'package:flutter_spinbox/material.dart';

class StepForm extends StatefulWidget {
  @override
  _StepFormState createState() => _StepFormState();
}

class _StepFormState extends State<StepForm> {
  String unit;
  List unitList = ['Hours', 'Minutes', 'Seconds'];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5),
      margin: EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        color: Color(0xfffFFC784),
        borderRadius: BorderRadius.circular(30),
      ),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 35, left: 30),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DrawCircle(),
                      // Text(
                      //   "1",
                      //   style: TextStyle(fontSize: 20, color: Colors.black),
                      // ),
                      Container(
                          width: 250,
                          height: 30,
                          child: buildDescriptionFormField()),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 55),
                        child: Container(
                          height: 30,
                          width: 150,
                          child: SpinBox(
                            min: 1,
                            max: 59,
                            value: 0,
                            // direction: Axis.vertical,
                            onChanged: (value) => print(value),
                          ),
                        ),
                      ),
                      Spacer(flex: 2),
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: DropdownButton(
                            hint: Text(
                              "unit",
                              textAlign: TextAlign.center,
                            ),
                            dropdownColor: Colors.white,
                            underline: SizedBox(),
                            value: unit,
                            onChanged: (newValue) {
                              setState(() {
                                unit = newValue;
                              });
                            },
                            items: unitList.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem,
                                    textAlign: TextAlign.center),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      // Container(
                      //   height: 30,
                      //   width: 150,
                      //   child: CupertinoSpinBox(
                      //     min: 1,
                      //     max: 100,
                      //     value: 50,
                      //     cursorColor: Colors.orange,
                      //     // direction: Axis.vertical,
                      //     onChanged: (value) => print(value),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 50),
                    child: Container(
                        width: 250, height: 30, child: buildPictureFormField()),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

TextFormField buildDescriptionFormField() {
  return TextFormField(
    decoration: InputDecoration(
      hintText: "Description",
      filled: true,
      fillColor: Colors.white,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 4),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color(0xFFFFC784),
        ),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color(0xFFFFC784),
        ),
      ),
    ),
  );
}

TextFormField buildPictureFormField() {
  return TextFormField(
    decoration: InputDecoration(
      hintText: "Picture",
      filled: true,
      fillColor: Colors.white,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 4),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color(0xFFFFC784),
        ),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color(0xFFFFC784),
        ),
      ),
    ),
  );
}

class DrawCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Color(0xffFFB448),
        shape: BoxShape.circle,
      ),
      child: Text(
        "1",
        style: TextStyle(fontSize: 20, color: Color(0xff091D67)),
        textAlign: TextAlign.center,
      ),
    );
  }
}
