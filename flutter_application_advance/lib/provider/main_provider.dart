import 'package:flutter/material.dart';
import 'package:flutter_application_advance/UI/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void logout(BuildContext context) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();
    await _sharedPreferences.clear();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
  }
}
