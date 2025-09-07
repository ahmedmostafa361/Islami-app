import 'package:flutter/material.dart';
import 'package:islami_app_flutter/utlis/app_colors%20.dart';
import 'package:islami_app_flutter/utlis/app_text%20.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparentColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.blackColor
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.goldColor,width: 2))
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.bgColor,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.goldColor),
      titleTextStyle: AppTextStyle.bold20Gold
    )
  );
}