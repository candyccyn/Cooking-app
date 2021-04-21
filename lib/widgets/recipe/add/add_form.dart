import 'package:cooking_app/widgets/shared/roundedbutton.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

class AddFrom extends StatefulWidget {
  @override
  _AddFromState createState() => _AddFromState();
}

class _AddFromState extends State<AddFrom> {
  String unit;
  String type;
  int count = 1;
  List unitItem = ['grams', 'kilo'];
  List typeItem = ['Asian ', 'European ', 'Drinks', 'Desserts'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Menu name",
          style:
              TextStyle(color: Color(0xff7C7C7C), fontWeight: FontWeight.bold),
        ),
        buildMenuNameFormField(),
        SizedBox(height: 10),
        Row(
          children: [
            Text("Picture",
                style: TextStyle(
                    color: Color(0xff7C7C7C), fontWeight: FontWeight.bold)),
            Spacer(),
            Text("Category",
                style: TextStyle(
                    color: Color(0xff7C7C7C), fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          children: [
            Container(width: 230, child: buildPictureFormField()),
            Spacer(flex: 2),
            Container(
              width: 120,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFFFC784)),
                  borderRadius: BorderRadius.circular(25),
                  color: Color(0xFFFFC784)),
              child: Center(
                child: DropdownButton(
                  hint: Text(
                    "Select type",
                    textAlign: TextAlign.center,
                  ),
                  dropdownColor: Color(0xFFFFC784),
                  underline: SizedBox(),
                  style: TextStyle(
                    color: Color(0xff091D67),
                  ),
                  value: type,
                  onChanged: (newValue) {
                    setState(() {
                      type = newValue;
                    });
                  },
                  items: typeItem.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem, textAlign: TextAlign.center),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        Text("Ingredients",
            style: TextStyle(
                color: Color(0xff7C7C7C), fontWeight: FontWeight.bold)),
        ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            shrinkWrap: true,
            itemCount: count,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Container(width: 230, child: buildIngredientFormField()),
                  Spacer(flex: 2),
                  Container(
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFFFC784)),
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xFFFFC784)),
                    child: Center(
                      child: DropdownButton(
                        hint: Text(
                          "Select unit",
                          textAlign: TextAlign.center,
                        ),
                        dropdownColor: Color(0xFFFFC784),
                        underline: SizedBox(),
                        style: TextStyle(
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
                            child: Text(valueItem, textAlign: TextAlign.center),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              );
            }),
        SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 34,
          child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                      style: BorderStyle.solid, color: Color(0xffFFA132))),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  count += 1;
                });
              },
              child: Text(
                "+ Add ingredient",
                style: TextStyle(fontSize: 15, color: Color(0xffFFA132)),
              )),
        ),
      ],
    )));
  }
}

TextFormField buildMenuNameFormField() {
  return TextFormField(
    decoration: InputDecoration(
      filled: true,
      fillColor: Color(0xFFFFC784),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 10),
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
      filled: true,
      fillColor: Color(0xFFFFC784),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 10),
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

TextFormField buildIngredientFormField() {
  return TextFormField(
    decoration: InputDecoration(
      filled: true,
      fillColor: Color(0xFFFFC784),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 10),
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
