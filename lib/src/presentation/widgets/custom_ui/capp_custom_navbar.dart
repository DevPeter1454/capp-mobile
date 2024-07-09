import 'package:capp/src/presentation/screens/dashboard/tabs/notification/notification_screen.dart';
import 'package:capp/src/presentation/screens/dashboard/tabs/profile/profile_screen.dart';
import 'package:capp/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CappCustomButtomNavBar extends StatefulWidget {
  final Widget customWidget;
  const CappCustomButtomNavBar({Key? key, required this.customWidget})
      : super(key: key);

  @override
  State<CappCustomButtomNavBar> createState() => _CappCustomButtomNavBarState();
}

PageController _pageController = PageController(initialPage: 0);
navigationTapped(int page) {
  if (page != 3) {
    _pageController.jumpToPage(page);
  }
}

class _CappCustomButtomNavBarState extends State<CappCustomButtomNavBar> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
    super.initState();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _pageController.dispose();
  // }

  void onPageChanged(int page) {
    setState(() {
      _selectedIndex = page;
    });
  }

  void navigateTo(int page) {
    setState(() {
      _selectedIndex = page;
    });
    _pageController.jumpToPage(page);
  }

  // exitDialog(BuildContext context) {
  //   if (_selectedIndex != 0) {
  //     _pageController.animateToPage(0,
  //         duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
  //   } else {
  //     CustomDialogWidgets.buildOperationStatusDialog(
  //         // context: context,

  //         title: 'Do You Wish to Quit the App',
  //         desc: '',
  //         onPositiveBtnTap: () {
  //           exit(0);
  //         },
  //         positiveBtnTitle: 'Yes',
  //         negativeBtnTitle: 'No',
  //         onNegativeBtnTap: () {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SizedBox(
        height: context.height,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: onPageChanged,
          children: <Widget>[
            widget.customWidget,
            const NotiificationScreen(),
            const ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFF797A7A).withOpacity(.1),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        margin: const EdgeInsets.only(bottom: 5, right: 10, left: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => navigateTo(0),
                child: SizedBox(
                  height: 45,
                  child: Column(
                    children: [
                      _selectedIndex == 0
                          ? Image.asset(
                              'assets/images/home_selected.png',
                              height: 24,
                              width: 24,
                            )
                          : Image.asset(
                              'assets/images/home.png',
                              height: 24,
                              width: 24,
                            ),
                      Text('Home',
                          style: TextStyle(
                              color: _selectedIndex == 0
                                  ? AppColors.primary
                                  : Colors.black))
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => navigateTo(1),
                child: SizedBox(
                  height: 45,
                  child: Column(
                    children: [
                      _selectedIndex == 1
                          ? Image.asset(
                              'assets/images/notification_selected.png',
                              height: 24,
                              width: 24,
                            )
                          : Image.asset(
                              'assets/images/notification.png',
                              height: 24,
                              width: 24,
                            ),
                      Text(
                        'Notification',
                        style: TextStyle(
                            color: _selectedIndex == 1
                                ? AppColors.primary
                                : Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => navigateTo(2),
                child: SizedBox(
                  height: 45,
                  child: Column(
                    children: [
                      _selectedIndex == 2
                          ? Image.asset(
                              'assets/images/profile-tick_selected.png',
                              height: 24,
                              width: 24,
                            )
                          : Image.asset(
                              'assets/images/profile-tick.png',
                              height: 24,
                              width: 24,
                            ),
                      Text('Profile',
                          style: TextStyle(
                              color: _selectedIndex == 2
                                  ? AppColors.primary
                                  : Colors.black))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
