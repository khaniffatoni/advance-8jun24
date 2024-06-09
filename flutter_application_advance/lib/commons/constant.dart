import 'package:flutter/material.dart';
import 'package:flutter_application_advance/models/tab_item.dart';

import 'color_pallete.dart';

List<TabItem> listBottomItem = [
  TabItem(
      Icon(
        Icons.portrait,
      ),
      'My Profile'),
  TabItem(
      Icon(
        Icons.monetization_on,
      ),
      'Payment'),
  TabItem(
      Icon(
        Icons.pie_chart,
      ),
      'History Payment'),
  TabItem(
      Icon(
        Icons.star,
      ),
      'Favorite'),
  // BottomNavigationBarItem(
  //     icon: Icon(
  //       Icons.portrait,
  //     ),
  //     backgroundColor: primaryColor,
  //     label: 'My Profile'),
  // BottomNavigationBarItem(
  //     backgroundColor: primaryColor,
  //     icon: Icon(Icons.monetization_on),
  //     label: 'Payment'),
  // BottomNavigationBarItem(
  //     backgroundColor: primaryColor,
  //     icon: Icon(Icons.pie_chart),
  //     label: 'History Payment'),
  // BottomNavigationBarItem(
  //     backgroundColor: primaryColor, icon: Icon(Icons.star), label: 'Favorites')
];

const String mainPage = 'Main Page xxxx';