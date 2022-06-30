import 'package:flutter/material.dart';
import 'package:mebex_0_1_0/ui/theme/app_theme_data.dart';

enum ThemeType { light, dark }

class ThemeModel extends ChangeNotifier {
  ThemeData currentTheme = lightTheme;
  ThemeType _themeType = ThemeType.light;
}
