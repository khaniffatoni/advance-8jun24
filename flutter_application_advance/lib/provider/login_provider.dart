import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailField = TextEditingController();
  TextEditingController passwordField = TextEditingController();
  bool statusObsecure = true;

  String messageError = '';
  void setObsecurePass() {
    statusObsecure = !statusObsecure;
    notifyListeners();
  }

  void processLogin() {
    if (formKey.currentState!.validate()) {
      messageError = 'Success';
    }
    notifyListeners();
  }
}
