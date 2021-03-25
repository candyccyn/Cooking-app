import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCard extends StatelessWidget {
  final String pngSrc;
  final String title;
  final Function press;
  const CategoryCard({
    Key key,
    this.pngSrc,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color.fromRGBO(255, 149, 24, 0.89)),
        ),
        child: InkWell(
          onTap: press,
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            child: Row(
                children: <Widget>[
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Century Gothic',
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color.fromRGBO(255, 149, 24, 0.89)
                    ),
                  ),
                  Spacer(),
                  Image.asset(pngSrc,
                  height: 48,
                  width: 48),
                  Spacer(),

                ],
              ),
          ),
        ),
    );
  }
}
