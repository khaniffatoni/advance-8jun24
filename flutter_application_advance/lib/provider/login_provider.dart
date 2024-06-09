import 'package:flutter/material.dart';
import 'package:flutter_application_advance/UI/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailField = TextEditingController();
  TextEditingController usernameField = TextEditingController();
  TextEditingController passwordField = TextEditingController();
  bool statusObsecure = true;

  String messageError = '';
  void setObsecurePass() {
    statusObsecure = !statusObsecure;
    notifyListeners();
  }

  void processLogin(BuildContext context) async {
    SharedPreferences _sharedPreferences =
        await SharedPreferences.getInstance();

    if (formKey.currentState!.validate()) {
      await _sharedPreferences.setString('username', usernameField.text);
      await _sharedPreferences.setString('email', emailField.text);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainPage(emailField.text, usernameField.text),
          ));
    }
    notifyListeners();
  }
}
