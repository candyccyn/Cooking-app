import 'package:flutter/material.dart';

class LoadImage extends StatefulWidget {
  static String routeName = "/image";
  @override
  _LoadImageState createState() => _LoadImageState();
}

class _LoadImageState extends State<LoadImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.yellow,
      child: Image.network(
        "https://firebasestorage.googleapis.com/v0/b/cooking-app-447bb.appspot.com/o/meme_web_01.jpg?alt=media&token=67fdca24-8c48-41f0-95d5-8c5c5e85c457",
        fit: BoxFit.cover,
      ),
    );
  }
}

