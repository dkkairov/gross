import 'package:flutter/material.dart';
import 'package:mex/ui/theme/app_colors.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.mainRed,
      actionsIconTheme: const IconThemeData(color: AppColors.mainWhite),
    ),
    scaffoldBackgroundColor: AppColors.mainLightGrey,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.mainRed,
      unselectedItemColor: AppColors.mainGrey,
    ),
    primaryColor: AppColors.mainBlack,
    textTheme: const TextTheme(
      subtitle1: TextStyle(color: AppColors.mainBlack),
      subtitle2: TextStyle(color: AppColors.mainBlack),
      headline1: TextStyle(color: AppColors.mainBlack),
      headline2: TextStyle(color: AppColors.mainBlack),
      bodyText1: TextStyle(color: AppColors.mainBlack),
      bodyText2: TextStyle(color: AppColors.mainBlack),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.mainBlue,
    ),
    listTileTheme: const ListTileThemeData(
      textColor: AppColors.mainBlack,
    ));
