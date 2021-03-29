import 'package:flutter/material.dart';

class RecommendCard extends StatelessWidget {
  final String image;
  final String title;
  final Function press;
  final bool isFavourite;
  final bool isLike;
  const RecommendCard({
    Key key,
    this.image,
    this.title,
    this.press,
    this.isFavourite = false,
    this.isLike = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: InkWell(
          onTap: press,
          child: Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(image,
                height: 48,
                width: 48),
          ),
        ),
      ),
    );
  }
}
