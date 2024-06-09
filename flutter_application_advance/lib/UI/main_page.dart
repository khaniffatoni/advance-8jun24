import 'package:flutter/material.dart';
import 'package:flutter_application_advance/UI/two_page.dart';
import 'package:flutter_application_advance/commons/color_pallete.dart';
import 'package:flutter_application_advance/commons/constant.dart';
import 'package:flutter_application_advance/provider/main_provider.dart';
import 'package:provider/provider.dart';

import '../commons/widget/app_bar_custom.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<MainProvider>();
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.sizeOf(context).width, 50),
            child: AppBarCustom('Main Page', Colors.blue)),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: provider.indexTab,
            onTap: (value) => context.read<MainProvider>().changeBody(value),
            // unselectedItemColor: primaryColor,
            // unselectedLabelStyle: TextStyle(color: primaryColor),
            items: listBottomItem
                .map((e) => BottomNavigationBarItem(
                    icon: e.icon,
                    label: e.label,
                    backgroundColor: primaryColor))
                .toList()),
        body: bodyMain(provider.indexTab));
  }

  Widget bodyMain(int index) {
    switch (index) {
      case 0:
        return Center(
          child: Row(
            children: [Text('My Profile')],
          ),
        );
      case 1:
        return Center(
          child: Row(
            children: [Text('Payment Method')],
          ),
        );
      case 2:
        return Center(
          child: Row(
            children: [Text('History Payment')],
          ),
        );
      case 3:
        return Center(
          child: Row(
            children: [Text('Favorites')],
          ),
        );

      default:
        return SizedBox();
    }
  }
}
