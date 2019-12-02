import 'package:flutter/material.dart';

class Styles {
  // ----------------------------------- NOTE: Measurements
  static const double bigSpacing = 25;
  static const double smallSpacing = 15;
  static const double superSmallSpacing = 10;

  // ----------------------------------- NOTE: Colours
  static const Color black = Color(0xFF232323);
  static const Color white = Color(0xFFDFDFDF);
  static const Color gold = Color(0xFFcc9026);
  static const Color shinyGold = Color(0xFFe89834);

  // ----------------------------------- NOTE: Text Styles
  static const TextStyle h2 = TextStyle(
    fontFamily: 'Inquisition',
    color: Styles.white,
    fontSize: 24,
  );

  static const TextStyle h1 = TextStyle(
    fontFamily: 'Inquisition',
    color: Styles.white,
    fontSize: 32,
  );

  static const TextStyle pFancy = TextStyle(
    fontFamily: 'Estre',
    color: Styles.white,
    fontSize: 18,
  );
}
