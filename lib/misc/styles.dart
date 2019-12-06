import 'package:flutter/material.dart';

class Styles {
  // ----------------------------------- NOTE: Measurements
  static const double bigSpacing = 25;
  static const double smallSpacing = 15;
  static const double superSmallSpacing = 10;
  static const double leadingTopMargin = 5;

  // ----------------------------------- NOTE: Colours
  static const Color black = Color(0xFF232323);
  static const Color white = Color(0xFFDFDFDF);
  static const Color goldenBrown = Color(0xFFcc9026);
  static const Color goldenRetriver = Color(0xFFe89834);
  static const Color yellow = Color(0xFFFBCA3C);

  // ----------------------------------- NOTE: Text Styles
  static final TextStyle h1Fancy = TextStyle(
    fontFamily: 'Inquisition',
    color: Styles.white,
    fontSize: 32,
  );

  static final TextStyle h2Fancy = h1Fancy.copyWith(fontSize: 24);
  static final TextStyle h3 = TextStyle(
    fontFamily: "Estre",
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: yellow,
  );

  static final TextStyle p = TextStyle(
    fontFamily: 'Estre',
    color: Styles.white,
    fontSize: 18,
  );

  static final TextStyle i = p.copyWith(fontStyle: FontStyle.italic);

  static final TextStyle bold = p.copyWith(fontWeight: FontWeight.bold);
  static final TextStyle caption = p.copyWith(fontSize: 20);
  static final TextStyle boldItalicYellow = p.copyWith(
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    color: yellow,
  );

  // ------------------ NOTE: Characters Text Styles
  static final TextStyle sera = TextStyle(
    fontFamily: "Caveat-Bold",
    fontSize: 20,
    color: Styles.white,
  );
}
