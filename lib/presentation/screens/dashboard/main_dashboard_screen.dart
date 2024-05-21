
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:capp/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import '../../widgets/widgets.dart';
import 'tabs/home/main_home_screen.dart';
import 'tabs/orders/main_my_orders_tab.dart';
import 'tabs/profile/main_account_tab.dart';
import 'tabs/wallets/main_wallets_tab.dart';

class MainDashboardScreen extends StatefulWidget {
  const MainDashboardScreen({Key? key}) : super(key: key);

  @override
  State<MainDashboardScreen> createState() => _MainDashboardScreenState();
}


PageController _pageController = PageController(initialPage: 0);
navigationTapped(int page) {
  if (page != 3) {
    _pageController.jumpToPage(page);
  }
}

class _MainDashboardScreenState extends State<MainDashboardScreen> {
  var scaffoldKey =  GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
      _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _selectedIndex = page;
    });
  }



  exitDialog(BuildContext context) {
    if (_selectedIndex != 0) {
      _pageController.animateToPage(0,
          duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
    } else {
      CustomDialogWidgets.buildOperationStatusDialog(
          // context: context,
          icon: Icons.app_shortcut_rounded,
          iconColor: Colors.red,
          title: 'Current Price',
          desc: 'Do you wish to quit the app',
          onPositiveBtnTap: () {
            exit(0);
          },
          positiveBtnTitle: 'Yes',
          negativeBtnTitle: 'No',
          onNegativeBtnTap: () {

          });

    }
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<ThemeProvider>(builder: (context, theme, child)
    {
      return WillPopScope(
        onWillPop: () => exitDialog(context),
        child: Scaffold(
            key: scaffoldKey,
            body:  Container(
                height: size.height,
                child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: onPageChanged,
                    children: const <Widget>[
                      MainHomeScreen(),
                      MainMyOrdersTab(),
                      MainAccountTab(),
                    ])),
            bottomNavigationBar: CustomBottomNavWidget(
              onChanged: (index){
                _pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
              },
              selectedIndex: _selectedIndex,
            )),
      );
    });
  }
}

