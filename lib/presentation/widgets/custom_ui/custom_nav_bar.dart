
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:capp/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class CustomBottomNavWidget extends StatelessWidget {
  const CustomBottomNavWidget({
    Key? key, required this.selectedIndex, required this.onChanged,
  }) : super(key: key);
  final int selectedIndex;
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, theme, child)
    {
      return SafeArea(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)
              ),
              color: theme.isDarkMode ? const Color(0xFF797A7A).withOpacity(.4) : Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 12),
                child: GNav(
                  rippleColor:Theme.of(context).highlightColor.withOpacity(.3),
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: theme.isDarkMode ? Colors.white:Theme.of(context).highlightColor,
                  iconSize: 24,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor:theme.isDarkMode ? Theme.of(context).highlightColor.withOpacity(.4):  Theme.of(context).highlightColor.withOpacity(.08),
                  color: Theme.of(context).highlightColor,
                  tabs: [
                    const GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    const GButton(
                      icon: Icons.shopping_cart,
                      text: 'Orders',
                    ),
                    const GButton(
                      icon: Icons.person,
                      text: 'Profile',
                    ),
                  ],
                  selectedIndex: selectedIndex,
                  onTabChange: onChanged,
                )
            )),
      );
    });
  }
}