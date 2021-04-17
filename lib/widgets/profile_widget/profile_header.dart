import 'package:cooking_app/widgets/recipe/add/step_form.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatefulWidget {
  @override
  _ProfileHeaderState createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
   //   color: Colors.green,
      height: size.height * 0.35,
      child: Center(
        child: Stack(fit: StackFit.expand, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                  height: 44,
                  child: Container(
                    decoration: ShapeDecoration(
                        color: Color.fromRGBO(255, 161, 50, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30)))),
                    child: IconButton(
                      icon: const Icon(Icons.edit),
                      color: Colors.white,
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                  )),
            ],
          ),
          ProfilePicture(),
        ]),
      ),
    );

    // return Scaffold(
    //   body: Container(
    //       color: Colors.green,
    //       height: size.height * 0.35,
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.end,
    //         children: [
    //           SizedBox(
    //               height: 44,
    //               child: Container(
    //                 decoration: ShapeDecoration(
    //                     color: Color.fromRGBO(255, 161, 50, 1),
    //                     shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.only(
    //                             topLeft: Radius.circular(30),
    //                             bottomLeft: Radius.circular(30)))),
    //                 child: IconButton(
    //                   icon: const Icon(Icons.edit),
    //                   color: Colors.white,
    //                   onPressed: () {
    //                     setState(() {});
    //                   },
    //                 ),
    //               )),

    //         ],
    //       ),

    //     ),

    // );
  }
}

class ProfilePicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        width: 76,
        height: 76,
        decoration: BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
      ),
      SizedBox(height: 15),
      Text(
        'username',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'Century Gothic',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color.fromRGBO(9, 29, 103, 1)),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget iaculis dolor. Etiam arcu tortor, feugiat nec feugiat nec, maximus vitae mi.',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Century Gothic',
              color: Color.fromRGBO(9, 29, 103, 1)),
        ),
      ),
    ]);
  }
}
