import 'package:flutter/material.dart';
import 'app_colors.dart';

/// 应用文本样式常量
class AppTextStyles {
  // 防止实例化
  AppTextStyles._();

  /// 基础字体大小
  static const double _fontSizeSmall = 12.0;
  static const double _fontSizeRegular = 14.0;
  static const double _fontSizeMedium = 16.0;
  static const double _fontSizeLarge = 18.0;
  static const double _fontSizeXLarge = 20.0;
  static const double _fontSizeXXLarge = 24.0;

  /// 浅色主题文本样式
  static const TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
    displaySmall: TextStyle(
      fontSize: _fontSizeXXLarge,
      fontWeight: FontWeight.bold,
      color: AppColors.textPrimary,
    ),
    headlineLarge: TextStyle(
      fontSize: _fontSizeXLarge,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    headlineMedium: TextStyle(
      fontSize: _fontSizeLarge,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    headlineSmall: TextStyle(
      fontSize: _fontSizeMedium,
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
    bodyLarge: TextStyle(
      fontSize: _fontSizeMedium,
      fontWeight: FontWeight.normal,
      color: AppColors.textPrimary,
    ),
    bodyMedium: TextStyle(
      fontSize: _fontSizeRegular,
      fontWeight: FontWeight.normal,
      color: AppColors.textPrimary,
    ),
    bodySmall: TextStyle(
      fontSize: _fontSizeSmall,
      fontWeight: FontWeight.normal,
      color: AppColors.textSecondary,
    ),
  );

  /// 深色主题文本样式
  static const TextTheme darkTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.textWhite,
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColors.textWhite,
    ),
    displaySmall: TextStyle(
      fontSize: _fontSizeXXLarge,
      fontWeight: FontWeight.bold,
      color: AppColors.textWhite,
    ),
    headlineLarge: TextStyle(
      fontSize: _fontSizeXLarge,
      fontWeight: FontWeight.w600,
      color: AppColors.textWhite,
    ),
    headlineMedium: TextStyle(
      fontSize: _fontSizeLarge,
      fontWeight: FontWeight.w600,
      color: AppColors.textWhite,
    ),
    headlineSmall: TextStyle(
      fontSize: _fontSizeMedium,
      fontWeight: FontWeight.w600,
      color: AppColors.textWhite,
    ),
    bodyLarge: TextStyle(
      fontSize: _fontSizeMedium,
      fontWeight: FontWeight.normal,
      color: AppColors.textWhite,
    ),
    bodyMedium: TextStyle(
      fontSize: _fontSizeRegular,
      fontWeight: FontWeight.normal,
      color: AppColors.textWhite,
    ),
    bodySmall: TextStyle(
      fontSize: _fontSizeSmall,
      fontWeight: FontWeight.normal,
      color: AppColors.textHint,
    ),
  );
} 