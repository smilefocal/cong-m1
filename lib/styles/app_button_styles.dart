import 'package:congraph/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AppButtonStyles {
  final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: AppColors.color3,
    ),
  );

  final textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: AppColors.color1,
    ),
  );

  static final ButtonStyle elevatedButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      AppColors.color2,
    ),
  );

  static const iconTheme = AppColors.color4;
}
