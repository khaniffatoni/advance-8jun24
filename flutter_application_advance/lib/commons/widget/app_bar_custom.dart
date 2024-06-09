// ignore_for_file: must_be_immutable

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
        style: const TextStyle(color: Colors.red),
      ),
      backgroundColor: colorAppBar,
    );
  }
}
