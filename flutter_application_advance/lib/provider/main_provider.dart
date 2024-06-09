import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  String title = 'Halaman Pertama';
  int indexTab = 0;
  String genderSelected = 'Male';
  String religionSelected = 'Budha';
  List<String> hobbySelected = [];
  void changeBody(int index) {
    indexTab = index;
    notifyListeners();
  }

  void selectGender(String value) {
    genderSelected = value;
    notifyListeners();
  }

  void selectReligion(String value) {
    religionSelected = value;
    notifyListeners();
  }

  void selectHobby(String value) {
    if (hobbySelected.contains(value)) {
      hobbySelected.removeWhere((element) => element == value);
    } else {
      hobbySelected.add(value);
    }
    notifyListeners();
  }
}
