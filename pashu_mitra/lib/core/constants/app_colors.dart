import 'package:flutter/material.dart';

/// 💚 PashuMitra App Color Palette
/// Centralized color definitions for consistent UI design.
/// Used throughout AppTheme, widgets, and screens.

class AppColors {
  // 🌿 Primary Palette
  static const Color primary = Color(0xFF2AA84A);
  static const Color primaryLight = Color(0xFF66BB6A);
  static const Color primaryDark = Color(0xFF1B5E20);

  static const Color secondary = Color(0xFF4CAF50);
  static const Color accent = Color(0xFF1ABC9C);

  // 🌞 Backgrounds
  static const Color background = Color(0xFFF5F6FA);
  static const Color card = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF9F9FB);

  // 🧾 Text Colors
  static const Color textPrimary = Color(0xFF0F1724);
  static const Color textSecondary = Color(0xFF6C7280);
  static const Color textLight = Color(0xFF9E9E9E);

  // 🧭 UI Elements
  static const Color border = Color(0xFFE0E0E0);
  static const Color divider = Color(0xFFEAEAEA);
  static const Color shadow = Color(0x1A000000);

  // ⚠️ Status Colors
  static const Color success = Color(0xFF27AE60);
  static const Color warning = Color(0xFFF5B700);
  static const Color error = Color(0xFFE74C3C);
  static const Color info = Color(0xFF2D9CDB);

  // 💧 Neutral Shades
  static const Color grey100 = Color(0xFFF8F9FA);
  static const Color grey200 = Color(0xFFF1F2F3);
  static const Color grey300 = Color(0xFFE5E7EB);
  static const Color grey400 = Color(0xFF9CA3AF);
  static const Color grey500 = Color(0xFF6B7280);

  // 🌅 Gradients
  static const LinearGradient greenGradient = LinearGradient(
    colors: [Color(0xFF43A047), Color(0xFF66BB6A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient blueGradient = LinearGradient(
    colors: [Color(0xFF2196F3), Color(0xFF64B5F6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient orangeGradient = LinearGradient(
    colors: [Color(0xFFFF9800), Color(0xFFFFC107)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // 💬 Alerts and Chips
  static const Color alertBackground = Color(0xFFFFF4E5);
  static const Color alertText = Color(0xFF795548);

  // 🧩 Miscellaneous
  static const Color disabled = Color(0xFFBDBDBD);
  static const Color overlay = Color(0x88000000);
}
