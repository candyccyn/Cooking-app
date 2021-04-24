import 'package:flutter/material.dart';

class CommentBar extends StatefulWidget {
  @override
  _CommentBarState createState() => _CommentBarState();
}

class _CommentBarState extends State<CommentBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        child: Row(
          children: [
            // Container(
            //     width: 40,
            //     height: 40,
            //     decoration: new BoxDecoration(
            //         shape: BoxShape.circle,
            //         image: new DecorationImage(
            //             fit: BoxFit.cover,
            //             image: new NetworkImage(
            //                 "https://www.dmarge.com/wp-content/uploads/2021/01/dwayne-the-rock-.jpg")))),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                  // width: MediaQuery.of(context).size.width/2-30.0,
                  height: 30,
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(242, 141, 22, 0.35),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          fontFamily: 'Century Gothic',
                          fontSize: 10,
                          color: Color.fromRGBO(9, 29, 103, 1)),
                      hintText: 'Comment here',
                      suffixIcon: IconButton(
                        onPressed: () => {},
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
