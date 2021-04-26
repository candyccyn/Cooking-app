import 'package:cooking_app/view_models/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cooking_app/models/ingredient.dart';

class Ingredients extends StatefulWidget {
  String countLine;
  Ingredients(String countLine) {
    this.countLine = countLine;
  }
  @override
  _IngredientState createState() => _IngredientState(this.countLine);
}

class _IngredientState extends State<Ingredients> {
  List unitItem = ['grams', 'kilo'];

  String countLine;

  String unit;
  _IngredientState(String countLine) {
    this.countLine = countLine;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    TextEditingController textController = TextEditingController();

    final menuProvider = Provider.of<MenuProvider>(context);
    Ingredient ingredient = Ingredient(
        textController.text, unit, int.tryParse(amountController.text));
    return Row(
      children: [
        Container(width: 140, child: buildIngredientFormField(textController)),
        // child: buildIngredientFormField(menuProvider, countLine)),
        Spacer(flex: 2),
        Container(width: 100, child: buildAmountFormField(amountController)),
        // width: 100, child: buildAmountFormField(menuProvider, countLine)),
        Spacer(flex: 1),
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
                textAlign: TextAlign.center,
              ),
              dropdownColor: Color(0xFFFFFE4C4),
              underline: SizedBox(),
              style: TextStyle(
                color: Color(0xff091D67),
              ),
              value: unit,
              onChanged: (newValue) {
                setState(() {
                  unit = newValue;
                });
                if (menuProvider.getIngredientPost.length <=
                    int.parse(countLine) - 1) {
                  menuProvider.addIngredient(
                      int.parse(countLine) - 1, ingredient);
                } else {
                  menuProvider.updateIngredient(
                      int.parse(countLine) - 1, ingredient);
                }
              },
              items: unitItem.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem, textAlign: TextAlign.center),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

TextFormField buildIngredientFormField(TextEditingController nameController
    // MenuProvider menuProvider,
    // String countLine,
    ) {
  return TextFormField(
    // onSaved: (value) {
    //   name = value;
    //   if (menuProvider.getIngredientPost.length <= int.parse(countLine) - 1) {
    //     menuProvider.addIngredient(int.parse(countLine) - 1, ingredient);
    //   } else {
    //     menuProvider.updateIngredient(int.parse(countLine) - 1, ingredient);
    //   }
    // },
    controller: nameController,
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

TextFormField buildAmountFormField(TextEditingController amountController
    //MenuProvider menuProvider, String countLine
    ) {
  return TextFormField(
    controller: amountController,
    // onSaved: (value) {
    //   amount = int.parse(value);
    //   if (menuProvider.getIngredientPost.length <= int.parse(countLine) - 1) {
    //     menuProvider.addIngredient(int.parse(countLine) - 1, ingredient);
    //   } else {
    //     menuProvider.updateIngredient(int.parse(countLine) - 1, ingredient);
    //   }
    // },
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
        //  gapPadding: 10,
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
