import 'package:flutter/material.dart';
import 'package:flutter_application_advance/UI/main_page.dart';

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

  void processLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainPage(emailField.text, usernameField.text),
          ));
    }
    notifyListeners();
  }
}
