import 'package:flutter/material.dart';
import 'package:news/components/app_text_style.dart';
import 'package:news/config/colors.dart';

var lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.lightBackground,

  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.lightPrimary,
    onPrimary: AppColors.lightTextPrimary,
    secondary: AppColors.lightSecondary,
    onSecondary: AppColors.lightTextSecondary,
    error: AppColors.lightError,
    onError: AppColors.lightDivider,
    surface: AppColors.lightSurface,
    onSurface: AppColors.lightCard,
  ),

  textTheme: AppTextStyles.lightTextTheme,


);

var darkTheme = ThemeData(
  brightness: Brightness.dark,

  scaffoldBackgroundColor: AppColors.darkBackground,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.darkPrimary,
    onPrimary: AppColors.darkTextPrimary,
    secondary: AppColors.darkSecondary,
    onSecondary: AppColors.darkTextSecondary,
    error: AppColors.darkError,
    onError: AppColors.darkDivider,
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkCard,
  ),
  textTheme: AppTextStyles.darkTextTheme,
);
