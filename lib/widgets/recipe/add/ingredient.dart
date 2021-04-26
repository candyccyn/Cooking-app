import 'package:flutter/material.dart';

class Ingredient extends StatefulWidget {
  String countLine;
  Ingredient(String countLine){
    this.countLine=countLine;
  }
  @override
  _IngredientState createState() => _IngredientState(this.countLine);
}

class _IngredientState extends State<Ingredient> {
  List unitItem = ['grams', 'kilo'];
  String unit;
  String countLine;
  _IngredientState(String countLine){
    this.countLine=countLine;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 230, child: buildIngredientFormField()),
        Spacer(flex: 2),
        Container(
          width: 120,
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFFFFE4C4)),
              borderRadius: BorderRadius.circular(25),
              color: Color(0xFFFFFE4C4)),
          child: Center(
            child: DropdownButton(
              hint: Text(
                "Select unit",
                textAlign: TextAlign.center,style: TextStyle(fontFamily: "Century Gothic",)
              ),
              dropdownColor: Color(0xFFFFFE4C4),
              underline: SizedBox(),
              style: TextStyle(fontFamily: "Century Gothic",
                color: Color(0xff091D67),
              ),
              value: unit,
              onChanged: (newValue) {
                setState(() {
                  unit = newValue;
                });
              },
              items: unitItem.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem, textAlign: TextAlign.center,style: TextStyle(fontFamily: "Century Gothic",),),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

TextFormField buildIngredientFormField() {
  return TextFormField(
    decoration: InputDecoration(
      filled: true,
      fillColor: Color(0xFFFFFE4C4),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 10),
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
