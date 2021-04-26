import 'package:cooking_app/models/category_data.dart';
import 'package:cooking_app/view_models/menu_provider.dart';
import 'package:cooking_app/widgets/recipe/add/ingredient.dart';
import 'package:cooking_app/widgets/shared/roundedbutton.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:provider/provider.dart';

class AddFrom extends StatefulWidget {
  @override
  _AddFromState createState() => _AddFromState();
}

class _AddFromState extends State<AddFrom> {
  String type;
  int count = 1;
  TextEditingController menuNameController = new TextEditingController();
  TextEditingController menuPicController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    List<Category> allCategory = menuProvider.getCategory;
    print(allCategory);
    return SingleChildScrollView(
        child: Container(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Menu name",
          style: TextStyle(
            fontFamily: "Century Gothic",
            color: Color(0xff7C7C7C),
            fontWeight: FontWeight.bold,
          ),
        ),
        buildMenuNameFormField(menuNameController, menuProvider),
        SizedBox(height: 10),
        Row(
          children: [
            Text("Picture",
                style: TextStyle(
                    fontFamily: "Century Gothic",
                    color: Color(0xff7C7C7C),
                    fontWeight: FontWeight.bold)),
            Spacer(),
            Text("Category",
                style: TextStyle(
                    fontFamily: "Century Gothic",
                    color: Color(0xff7C7C7C),
                    fontWeight: FontWeight.bold)),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                  constraints: BoxConstraints(
                    maxWidth: double.infinity,
                  ),
                  child:
                      buildPictureFormField(menuPicController, menuProvider)),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
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
                      "Select type",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: "Century Gothic"),
                    ),
                    dropdownColor: Color(0xFFFFFE4C4),
                    underline: SizedBox(),
                    style: TextStyle(
                      fontFamily: "Century Gothic",
                      color: Color(0xff091D67),
                    ),
                    value: type,
                    onChanged: (newValue) {
                      setState(() {
                        type = newValue;
                        menuProvider.setMenuCategoryPost(type);
                      });
                    },
                    items: allCategory.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem.categoryName,
                        child: Text(valueItem.categoryName,
                            textAlign: TextAlign.center),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
        Text("Ingredients",
            style: TextStyle(
                fontFamily: "Century Gothic",
                color: Color(0xff7C7C7C),
                fontWeight: FontWeight.bold)),
        ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            shrinkWrap: true,
            itemCount: count,
            itemBuilder: (BuildContext context, int index) {
              return Ingredients(this.count.toString());
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
                style: TextStyle(
                    fontFamily: "Century Gothic",
                    fontSize: 15,
                    color: Color(0xffFFA132)),
              )),
        ),
      ],
    )));
  }
}

TextFormField buildMenuNameFormField(
    TextEditingController menuNameController, MenuProvider menuProvider) {
  return TextFormField(
    onChanged: (value) {
      menuProvider.setMenuNamePost(value);
    },
    controller: menuNameController,
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

TextFormField buildPictureFormField(
    TextEditingController menuPicController, MenuProvider menuProvider) {
  return TextFormField(
    controller: menuPicController,
    onChanged: (value) {
      menuProvider.setMenuImagePost(value);
    },
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
