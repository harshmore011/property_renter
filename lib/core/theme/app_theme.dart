
import 'package:flutter/material.dart' show Color, ColorScheme, ThemeData, Brightness;

class AppTheme {

  static final ColorScheme _colorScheme = ColorScheme.light(primary: primaryColor,
    secondary: primaryColor,);

  static const Color primaryColor = Color(0xFF302B63);
  static const Color headingColor = Color(0xFF252733);
  static const Color paragraphColor = Color(0xFF8A919D);
  static const Color infoBackgroundColor = Color(0xFFEFEFFF);
  // static const Color linearGradient = Color(90deg, #0F0C29 0%, #302B63 49.5%, #24243E 100%);
  // background: linear-gradient(90deg, #0F0C29 0%, #302B63 49.5%, #24243E 100%);
  // rgba(15, 12, 41, 1),rgba(48, 43, 99, 1),rgba(36, 36, 62, 1)


  final ThemeData theme = ThemeData(
    colorScheme: _colorScheme,
    brightness: Brightness.light,
    useMaterial3: true,
  );








}