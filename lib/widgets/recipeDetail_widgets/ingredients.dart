import 'package:flutter/material.dart';

class Ingredients extends StatelessWidget {
  const Ingredients({
    Key key,
    this.name,
    this.gram,
  }) : super(key: key);

  final String name, gram;

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
              children: [
                Expanded(
                  child: Text(name,
                      style: TextStyle(
                          fontSize: 14, color: Color.fromRGBO(9, 29, 103, 1))),
                ),
                Spacer(),
                Text(gram,
                    style: TextStyle(
                        fontSize: 14, color: Color.fromRGBO(9, 29, 103, 1))),
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
