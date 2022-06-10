import 'package:flutter/material.dart';
import 'package:mebex_0_1_0/ui/theme/app_colors.dart';

abstract class AppButtonStyle {
  static final ButtonStyle mainElevatedButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(AppColors.mainBlue),
    foregroundColor: MaterialStateProperty.all(AppColors.mainWhite),
    textStyle: MaterialStateProperty.all(
        TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700
        )
    ),
  );

  static final ButtonStyle addElevatedButton = mainElevatedButton.copyWith(
    backgroundColor: MaterialStateProperty.all(AppColors.mainGrey),
  );

  static final ButtonStyle mainTextButton = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(AppColors.mainDarkGrey),
    textStyle: MaterialStateProperty.all(
        TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700
        )
    ),
  );
}