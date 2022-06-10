import 'package:flutter/material.dart';
import 'package:mebex_0_1_0/ui/theme/app_colors.dart';

abstract class AppTextStyle {
  static TextStyle baseInputTextStyle = TextStyle(
    fontSize: 24,
    color: AppColors.mainBlack,
  );

  static TextStyle helperTextStyle = TextStyle(
    color: AppColors.mainDarkGrey,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
}