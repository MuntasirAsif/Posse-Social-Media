import 'package:flutter/material.dart';
import 'package:possy_app/core/theme/src/part/input_decoration_theme.dart';
import 'package:possy_app/core/theme/src/theme_extension/color_pallete.dart';
import 'package:possy_app/core/theme/src/theme_extension/text_theme.dart';

class AppTheme{
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    inputDecorationTheme: AppInputDecorationTheme.lightInputDecorationTheme,
    scaffoldBackgroundColor: AppColor.backgroundColor,
    textTheme: AppTextTheme.lightTextTheme,

  );
  static ThemeData darkTheme = ThemeData(

  );
}