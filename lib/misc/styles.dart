import 'package:flutter/material.dart';

class Styles {
  // ----------------------------------- NOTE: Measurements
  static const double bigSpacing = 25;
  static const double smallSpacing = 15;
  static const double superSmallSpacing = 10;
  static const double leadingTopMargin = 5;

  // ----------------------------------- NOTE: Colours
  static const Color black = Color(0xFF232323);
  static const Color grey = Color(0xff2F2F2F);
  static const Color white = Color(0xFFDFDFDF);
  static const Color cloudyWhite = Color(0xffb9b9b9);
  static const Color smoke = Color(0xff717171);
  static const Color goldenBrown = Color(0xFFcc9026);
  static const Color goldenRetriver = Color(0xFFe89834);
  static const Color yellow = Color(0xFFFBCA3C);
  static const Color disabledGrey = Color(0xff424242);
  static const Color disbaledLightGrey = Color(0xff484848);

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

  static const TextStyle p = TextStyle(
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

  static const TextStyle bFancy = TextStyle(
    fontFamily: "Asul",
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: Styles.white,
  );
  // static final TextStyle bFancy =

  // ------------------ NOTE: Characters Text Styles
  static final TextStyle sera = TextStyle(
    fontFamily: "Caveat",
    fontSize: 20,
    color: Styles.white,
    fontWeight: FontWeight.bold,
  );
}
