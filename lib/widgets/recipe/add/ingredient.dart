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
  List unitItem = ['grams', 'kilo', 'tbsp', 'tsp', 'oz', 'L', 'mL', 'cup'];

  String countLine;

  String unit;
  _IngredientState(String countLine) {
    this.countLine = countLine;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController amountController = TextEditingController();
    TextEditingController textController = TextEditingController();
    String name, amount;
    name = textController.text;
    amount = amountController.text;
    final menuProvider = Provider.of<MenuProvider>(context);
    return Row(
      children: [
        Expanded(
            child: Container(
                constraints: BoxConstraints(
                  maxWidth: double.infinity,
                ),
                child: buildIngredientFormField(textController))),
        // child: buildIngredientFormField(menuProvider, countLine)),
        SizedBox(width: 10),
        Container(width: 80, child: buildAmountFormField(amountController)),
        // width: 100, child: buildAmountFormField(menuProvider, countLine)),
        SizedBox(width: 10),
        Container(
          constraints: BoxConstraints(
            maxWidth: double.infinity,
          ),
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
              onTap: () {
                Ingredient ingredient = Ingredient(textController.text, unit,
                    int.tryParse(amountController.text));
                if (menuProvider.getIngredientPost.length <=
                    int.parse(countLine) - 1) {
                  menuProvider.addIngredient(
                      int.parse(countLine) - 1, ingredient);
                } else {
                  menuProvider.updateIngredient(
                      int.parse(countLine) - 1, ingredient);
                }
              },
              onChanged: (newValue) {
                setState(() {
                  unit = newValue;
                });
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

TextFormField buildIngredientFormField(TextEditingController textController
    // MenuProvider menuProvider,
    // String countLine,
    ) {
  return TextFormField(
    controller: textController,
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
