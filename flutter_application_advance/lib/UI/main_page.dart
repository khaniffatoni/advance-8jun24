import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_advance/UI/main/favorite_page.dart';
import 'package:flutter_application_advance/UI/main/history_payment_page.dart';
import 'package:flutter_application_advance/UI/main/payment_page.dart';
import 'package:flutter_application_advance/UI/main/profile_page.dart';
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
        drawer: navigationDrawer(context),
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.sizeOf(context).width, 50),
            child: AppBarCustom(mainPage, Colors.blue)),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: provider.indexTab > 4 ? 1 : provider.indexTab,
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
        return ProfilePage();
      case 1:
        return PaymentPage();
      case 2:
        return HistoryPaymentPage();
      case 3:
        return FavoritePage();

      default:
        return Center(
          child: Row(
            children: [Text('Navigation Drawer')],
          ),
        );
    }
  }

  Widget navigationDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          headerDrawer(),
          ListTile(
            leading: Icon(Icons.portrait),
            title: Text('My Profile'),
            onTap: () {
              context.read<MainProvider>().changeBody(10);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget headerDrawer() {
    return UserAccountsDrawerHeader(
        decoration: BoxDecoration(color: primaryColor),
        otherAccountsPictures: [
          Stack(
            children: [
              Icon(
                Icons.star,
                color: Colors.white,
              ),
              Positioned(
                right: 5,
                top: -5,
                child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.cyan, shape: BoxShape.circle),
                    child: Text(
                      '2',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    )),
              )
            ],
          ),
          Icon(
            Icons.bookmark,
            color: Colors.white,
          ),
        ],
        currentAccountPicture: ClipOval(
          child: Image.network(
              'https://marketplace.canva.com/EAFHfL_zPBk/1/0/1600w/canva-yellow-inspiration-modern-instagram-profile-picture-kpZhUIzCx_w.jpg'),
        ),
        accountName: Text('gustav'),
        accountEmail: Text('gustav@gmail.com'));
  }
}
