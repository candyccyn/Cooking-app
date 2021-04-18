import 'package:flutter/material.dart';

class ReviewPost extends StatelessWidget {
  const ReviewPost({
    Key key,
    this.description,
    this.username,
    this.image,
  }) : super(key: key);

  final String description, username, image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        // decoration: BoxDecoration(color: Colors.green),
        constraints: BoxConstraints(
          maxHeight: double.infinity,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 40,
                    height: 40,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: new NetworkImage(image)))),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: TextStyle(
                            fontFamily: 'Century Gothic',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color.fromRGBO(9, 29, 103, 1)),
                      ),
                      SizedBox(height: 5),
                      Text(
                        description,
                        style: TextStyle(
                            fontFamily: 'Century Gothic',
                            fontSize: 10,
                            color: Color.fromRGBO(9, 29, 103, 1)),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
