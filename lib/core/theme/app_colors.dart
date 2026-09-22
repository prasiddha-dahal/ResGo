import 'package:flutter/material.dart';

/// Central color palette.
class AppColors {
  AppColors._();

  // Primary
  static const Color primary = Color(0xFF2E7D32); // Green (food/ecom friendly)
  static const Color primaryDark = Color(0xFF1B5E20);
  static const Color primaryLight = Color(0xFF60AD5E);

  // Accent
  static const Color accent = Color(0xFFFF8F00); // Amber

  // Backgrounds
  static const Color background = Color(0xFFF8F5F0); // Soft cream
  static const Color surface = Colors.white;
  static const Color card = Colors.white;

  // Text
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6B6B6B);
  static const Color textOnPrimary = Colors.white;

  // Status
  static const Color success = Color(0xFF2E7D32);
  static const Color error = Color(0xFFC62828);
  static const Color warning = Color(0xFFF9A825);

  // Borders & dividers
  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFEEEEEE);
}