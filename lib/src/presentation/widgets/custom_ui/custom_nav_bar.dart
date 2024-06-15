import 'package:capp/src/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    Key? key,
    required this.selectedIndex,
    required this.onChanged,
  }) : super(key: key);
  final int selectedIndex;
  final ValueChanged onChanged;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, theme, child) {
      return SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
            color: theme.isDarkMode
                ? const Color(0xFF797A7A).withOpacity(.4)
                : Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => onChanged(selectedIndex),
                  child: SizedBox(
                    height: 46,
                    child: Column(
                      children: [
                        Image.asset('assets/images/home.png'),
                        const Text('Home')
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => onChanged(selectedIndex),
                  child: SizedBox(
                    height: 49,
                    child: Column(
                      children: [
                        Image.asset('assets/images/notification.png'),
                        const Text('Notification')
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => onChanged(selectedIndex),
                  child: SizedBox(
                    height: 49,
                    child: Column(
                      children: [
                        Image.asset('assets/images/profile-tick.png'),
                        const Text('Profile')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
