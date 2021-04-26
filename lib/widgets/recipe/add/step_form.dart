import 'package:cooking_app/models/step.dart';
import 'package:cooking_app/view_models/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinbox/cupertino.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:provider/provider.dart';

class StepForm extends StatefulWidget {
  String countStep;
  StepForm(String countStep) {
    this.countStep = countStep;
  }
  @override
  _StepFormState createState() => _StepFormState(this.countStep);
}

class _StepFormState extends State<StepForm> {
  String unit;
  String countStep;
  _StepFormState(String countStep) {
    this.countStep = countStep;
  }
  List unitList = ['Hours', 'Minutes', 'Seconds'];
  TextEditingController descriptionController = TextEditingController();
  TextEditingController pictureController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    double time;
    return Container(
      padding: EdgeInsets.only(right: 5),
      margin: EdgeInsets.symmetric(vertical: 5),
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        color: Color(0xFFFFFE4C4),
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
                      DrawCircle(this.countStep),
                      Container(
                          width: 250,
                          height: 30,
                          child:
                              buildDescriptionFormField(descriptionController)),
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
                            onChanged: (value) {
                              time = value;
                            },
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
                            onTap: () {
                              Steps steps = Steps(descriptionController.text,
                                  time.toInt(), unit);
                              if (menuProvider.getStepPost.length <=
                                  int.parse(countStep) - 1) {
                                menuProvider.addSteps(
                                    int.parse(countStep) - 1, steps);
                              } else {
                                menuProvider.updateSteps(
                                    int.parse(countStep) - 1, steps);
                              }
                            },
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
                    ],
                  ),
                  SizedBox(height: 20),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 50),
                  //   child: Container(
                  //       width: 250,
                  //       height: 30,
                  //       child: buildPictureFormField(pictureController)),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

TextFormField buildDescriptionFormField(
    TextEditingController descriptionController) {
  return TextFormField(
    controller: descriptionController,
    decoration: InputDecoration(
      hintText: "Description",
      filled: true,
      fillColor: Colors.white,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 4),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color(0xFFFFFE4C4),
        ),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Color(0xFFFFFE4C4),
        ),
      ),
    ),
  );
}

// TextFormField buildPictureFormField(TextEditingController pictureController) {
//   return TextFormField(
//     controller: pictureController,
//     decoration: InputDecoration(
//       hintText: "Picture",
//       filled: true,
//       fillColor: Colors.white,
//       floatingLabelBehavior: FloatingLabelBehavior.always,
//       contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 4),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(30),
//         borderSide: BorderSide(
//           color: Color(0xFFFFFE4C4),
//         ),
//         gapPadding: 10,
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(30),
//         borderSide: BorderSide(
//           color: Color(0xFFFFFE4C4),
//         ),
//       ),
//     ),
//   );
// }

class DrawCircle extends StatelessWidget {
  String countStep;
  DrawCircle(String countStep) {
    this.countStep = countStep;
  }
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
        countStep,
        style: TextStyle(fontSize: 20, color: Color(0xff091D67)),
        textAlign: TextAlign.center,
      ),
    );
  }
}
