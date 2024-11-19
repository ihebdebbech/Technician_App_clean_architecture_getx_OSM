import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class DefaultTheme {
  static ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    useMaterial3: true,
  );
}
