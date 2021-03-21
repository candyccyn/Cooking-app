import 'package:cooking_app/models/navigation_data.dart';
import 'package:flutter/cupertino.dart';

class NavigationViewModel {
  int selectedIndex = 1;

  NavigationData _item = NavigationData();

  Widget getWidget(int selectedIndex) {
    return _item.widgetOptions.elementAt(selectedIndex);
  }

}