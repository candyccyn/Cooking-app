import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  final int initialIndex;
  final ValueChanged<int> navCallback;

  Navigation({@required this.navCallback, this.initialIndex: 1});

  @override
  _NavigationState createState() => new _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialIndex;
    notifyCallback();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Color.fromRGBO(255, 161, 50, 1),
      elevation: 8.0,
      child: new Container(
        height: 56.0,
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildButton(0, Icons.bookmark, "Bookmarks"),
            _buildButton(1, Icons.search, "Home"),
            _buildButton(2, Icons.person, "Profile"),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(int index, IconData data, String tooltip) {
    return new Flexible(
      flex: 1,
      child: new Tooltip(
        message: tooltip,
        child: new InkWell(
          onTap: () => onButtonTap(index),
          child: new Center(
          child: new Icon(data,
              color: _selected == index ? Color.fromRGBO(9, 29, 103, 1) : Colors.white,
          ),
          ),
        ),
      ),
    );
  }

  onButtonTap(int index) {
    setState(() {
      _selected = index;
    });
    notifyCallback();
  }

  notifyCallback() {
    widget.navCallback(_selected);
  }
}