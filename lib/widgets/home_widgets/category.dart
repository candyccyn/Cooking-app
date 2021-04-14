import 'package:cooking_app/screens/category/categoryPage.dart';
import 'package:cooking_app/services/menu_service.dart';
import 'package:cooking_app/widgets/category_widgets/categoryBody.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cooking_app/view_models/menu_provider.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String title;
  final Function press;
  const CategoryCard({
    Key key,
    this.image,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);
    void _press() {
      menuProvider.setPickCategory(title);
      Navigator.push(context,
          new MaterialPageRoute(builder: (context) => new CategoryBody()));
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color.fromRGBO(255, 149, 24, 0.89)),
      ),
      child: InkWell(
        onTap: _press,
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          child: Row(
            children: <Widget>[
              Spacer(),
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    fontFamily: 'Century Gothic',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color.fromRGBO(255, 149, 24, 0.89)),
              ),
              Spacer(),
              Image.network(image, height: 48, width: 48),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
