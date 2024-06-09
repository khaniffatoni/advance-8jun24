import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget {
  String title;
  Color colorAppBar;
  AppBarCustom(this.title, this.colorAppBar, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.red),
      ),
      backgroundColor: colorAppBar,
    );
  }
}
