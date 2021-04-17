import 'package:cooking_app/models/menu.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final Function press;

  const MyCard({
    Key key,
    this.imagePath,
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
      padding: EdgeInsets.zero,
      child: SizedBox(
        width: width,
        child: GestureDetector(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 1.02,
                    child: Container(
                      padding: EdgeInsets.all(width),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(imagePath),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 30,
                      height: 30,
                      child: FloatingActionButton(
                        backgroundColor: Color(0xffFFA132),
                        onPressed: () {},
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                    fontFamily: 'Century Gothic',
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Color.fromRGBO(9, 29, 103, 1)),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
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
                    "951 likes",
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
