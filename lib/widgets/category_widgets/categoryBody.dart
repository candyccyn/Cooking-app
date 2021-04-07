import 'package:cooking_app/widgets/category_widgets/categoryHeader.dart';
import 'package:flutter/material.dart';

class CategoryBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
        child: Stack(
          children: <Widget>[
            CategoryHeader(),
            DraggableScrollableSheet(
              maxChildSize: 1,
              initialChildSize: 0.7,
              minChildSize: 0.7,
              builder: (context, controller) {
                return SingleChildScrollView(
                  controller: controller,
                  child: Container(
                    height: 800,
                    // padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
