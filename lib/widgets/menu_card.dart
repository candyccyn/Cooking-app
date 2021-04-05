import 'package:cooking_app/models/menu.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String image;
  final String title;
  final Function press;

  const MenuCard({
    Key key,
    this.image,
    this.title,
    this.press,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.menu,
  }) : super(key: key);

  final double width, aspectRetio;
  final Menu menu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: SizedBox(
        width: width,
        child: GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(width),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                    fontFamily: 'Century Gothic',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Color.fromRGBO(9, 29, 103, 1)),
                maxLines: 2,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(8),
                      height: 50,
                      width: 50,
                      child: Icon(Icons.thumb_up_off_alt),
                    ),
                  ),
                  Text(
                    "95 likes",
                    style: TextStyle(
                        fontFamily: 'Century Gothic',
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Color.fromRGBO(255, 149, 24, 0.89)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
