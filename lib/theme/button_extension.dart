import 'package:flutter/material.dart';

enum TextButtonStyleBorderStyle {
  normal,
  rounded,
}

enum TextButtonStyleWidth {
  shrink,
  filled,
}

extension TextButtonStyles on TextButton {
  static ButtonStyle filledButtonStyle(
    Color backgroundColor, {
    borderStyle = TextButtonStyleBorderStyle.normal,
    width = TextButtonStyleWidth.filled,
  }) {
    return TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 16),
      minimumSize: (width == TextButtonStyleWidth.filled)
          ? const Size.fromHeight(0)
          : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          (borderStyle == TextButtonStyleBorderStyle.normal) ? 4 : 100,
        ),
      ),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      foregroundColor: Colors.white,
      //TODO: change to theme value later
      backgroundColor: backgroundColor,
    );
  }
}

// extension TextButtonMoreTheme on TextButtonTheme {
//   TextButtonTheme moreTheme() {
//     return TextButton.styleFrom();
//   }
// }

extension ExtendedChipTheme on ThemeData {
  //TODO: write this onto theme
  ChipThemeData chipTheme() {
    return ChipThemeData(
      backgroundColor: Color(0xF6F5F1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    );
  }
}
