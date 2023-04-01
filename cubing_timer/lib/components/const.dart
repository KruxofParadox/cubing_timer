import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color mainColor = Colors.white;
Color textColor = Colors.black;
List<Color> accentColors = [
  Colors.deepPurple,
];
Color baseGrey = Colors.grey.shade300;

// DARK MODE COLOR PALETTE BELOW
Color darkModeColor = const Color(0xff27262E);

TextStyle convertFontToUbuntu(double size, bool boldened, Color chosenColor) {
  return GoogleFonts.ubuntu(
    textStyle: TextStyle(
      fontSize: size,
      fontWeight: boldened ? FontWeight.bold : FontWeight.normal,
      color: chosenColor,
    ),
  );
}
