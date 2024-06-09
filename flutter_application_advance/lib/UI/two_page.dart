import 'package:flutter/material.dart';

import '../commons/widget/app_bar_custom.dart';

class TwoPage extends StatelessWidget {
  const TwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width, 50),
          child: AppBarCustom('Main Page', Colors.blue)),
      body: Center(
        child: Text('Halaman Kedua'),
      ),
    );
  }
}
