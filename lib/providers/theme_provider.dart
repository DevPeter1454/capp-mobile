

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:capp/core/theme/app_colors.dart';


class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance?.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
      fontFamily:'Poppins',
    scaffoldBackgroundColor: const Color(0xFF121212),
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.dark().copyWith(secondary: AppColors.primary, primary: Colors.white),
    hintColor: const Color(0xFFF2F4F3),
    secondaryHeaderColor:  AppColors.primary,
      inputDecorationTheme:  InputDecorationTheme(
        labelStyle: const TextStyle(color: Color(0xffA0A3BD)),
        hintStyle: const TextStyle(color: Color(0xFFA1A3A2), fontSize: 16, fontWeight: FontWeight.w400),
        fillColor: const Color(0xFFFBFBFB).withOpacity(.05),
      ),
    dividerColor: const Color(0xFFE2F2DA),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primary,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
    ),
    highlightColor: AppColors.primary,
    bottomSheetTheme: const BottomSheetThemeData(
        modalBackgroundColor: Color(0xFF0F1010)
    ),
    shadowColor: const Color(0xFF253F17),

      primaryColorLight: Colors.white.withOpacity(.05),
    primaryColorDark: Colors.white.withOpacity(.05),
      selectedRowColor: const Color(0xFFF8F9F9).withOpacity(.1),
      indicatorColor:  AppColors.offWhite.withOpacity(.1) ,
      hoverColor: Colors.black45




    // iconTheme: IconThemeData(color: Color(0xFF0D4740)),
  );

  static final lightTheme = ThemeData(
    fontFamily: 'Poppins',
    shadowColor: const Color(0xFF072420),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: AppColors.primary,
    secondaryHeaderColor: Colors.white,
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: Color(0xffA0A3BD)),
      hintStyle: TextStyle(
          color: Color(0xFF797A7A), fontSize: 16, fontWeight: FontWeight.w400),
      fillColor: Color(0xFFFBFBFD),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.primary,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primary,
    ),
    highlightColor: AppColors.primary,
    bottomSheetTheme: const BottomSheetThemeData(modalBackgroundColor: Colors.white),
    dividerColor: const Color(0xFF5E8480),
    // primaryTextTheme: TextTheme(
    //     headline1: TextStyle(color: Color(0xFF333333))),
    hintColor: const Color(0xFF797A7A),
    colorScheme: const ColorScheme.light().copyWith(primary: AppColors.primary, secondary: Colors.white),
    primaryColorLight: Colors.transparent,
      primaryColorDark: Colors.white,
      selectedRowColor: const Color(0xFFF8F9F9),
      indicatorColor:  AppColors.offWhite,
      hoverColor: Colors.grey[100]
      // selectedRowColor: Color(0xFFFFFFFF)
    // iconTheme: IconThemeData(color: Colors.white),
  );

}
