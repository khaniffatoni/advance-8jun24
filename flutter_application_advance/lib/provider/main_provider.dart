import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  String title = 'Halaman Pertama';
  int indexTab = 0;

  void changeBody(int index) {
    indexTab = index;
    notifyListeners();
  }
}
