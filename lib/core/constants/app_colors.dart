import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary colors for child-friendly interface
  static const Color primary = Color(0xFF4CAF50);      // Green
  static const Color primaryVariant = Color(0xFF388E3C);
  static const Color secondary = Color(0xFFFF9800);     // Orange
  static const Color secondaryVariant = Color(0xFFF57C00);

  // Background colors
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Color(0xFFFFFFFF);

  // Game colors
  static const Color gameBackground = Color(0xFFE8F5E8);
  static const Color gridLine = Color(0xFFBDBDBD);
  static const Color goalTile = Color(0xFFFFD700);      // Gold
  static const Color wallTile = Color(0xFF795548);      // Brown
  static const Color keyTile = Color(0xFF2196F3);       // Blue

  // Character colors
  static const Color character = Color(0xFF9C27B0);     // Purple
  static const Color characterShadow = Color(0xFF7B1FA2);

  // Card colors
  static const Color moveUpCard = Color(0xFF4CAF50);    // Green
  static const Color moveDownCard = Color(0xFF4CAF50);
  static const Color moveLeftCard = Color(0xFF4CAF50);
  static const Color moveRightCard = Color(0xFF4CAF50);
  static const Color grabCard = Color(0xFF2196F3);      // Blue
  static const Color jumpCard = Color(0xFFFF9800);      // Orange

  // Block colors
  static const Color repeatBlock = Color(0xFFE91E63);   // Pink
  static const Color ifBlock = Color(0xFF9C27B0);       // Purple
  static const Color startBlock = Color(0xFF4CAF50);    // Green

  // UI colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);

  // Text colors
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textLight = Color(0xFFFFFFFF);
}