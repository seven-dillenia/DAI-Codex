import 'package:dai_codex/misc/styles.dart';
import 'package:flutter/material.dart';

class CodexText extends StatelessWidget {
  final List<String> lines;
  final Widget division = Divider(
    color: Styles.white,
  );

  final Widget center = Container(
    width: double.infinity,
    child: Center(
        child: Text(
      ". . .",
      style: TextStyle(fontFamily: "Estre", color: Styles.white, fontSize: 32, height: 0),
    )),
  );

  CodexText({@required this.lines});

  List<Widget> buildLines() {
    List<Widget> widgets = new List<Widget>();
    TextStyle _spanStyle = Styles.p;

    // Loop through each lines
    for (int i = 0; i < lines.length; i++) {
      String oneLine = lines[i];
      List<String> words = oneLine.split(" ");
      List<TextSpan> spans = new List<TextSpan>();
      bool hasDivision = false;
      bool hasCenter = false;

      // Loop through each word
      // Skip blank lines
      if (lines[i].isNotEmpty) {
        for (int j = 0; j < words.length; j++) {
          switch (words[j]) {
            case StartTags.italic:
              _spanStyle = Styles.i;
              break;
            case StartTags.h3:
              _spanStyle = Styles.h3;
              break;
            case StartTags.h4:
              _spanStyle = Styles.boldItalicYellow;
              break;
            case StartTags.bold:
              _spanStyle = Styles.bold;
              break;
            case StartTags.sera:
              _spanStyle = Styles.sera;
              break;
            case StartTags.division:
              hasDivision = true;
              break;
            case StartTags.center:
              hasCenter = true;
              break;
            default:
              if (EndTags.allEndTags.contains(words[j])) {
                _spanStyle = Styles.p;
              } else {
                TextSpan s = TextSpan(text: words[j] + " ", style: _spanStyle);
                spans.add(s);
              }
              break;
          }
        }
      }

      Widget w = SelectableText.rich(
        TextSpan(children: spans),
      );

      widgets.add(w);

      if (hasDivision) {
        widgets.add(this.division);
      }

      if (hasCenter) {
        widgets.add(center);
      }
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: buildLines(),
    );
  }
}

class StartTags {
  static const italic = "<i>";
  static const bold = "<b>";
  static const h3 = "<h3>";
  static const h4 = "<h4>";
  static const center = "<center>";

  // -------------------------- NOTE: Custom Tags
  static const division = "<division>";

  // -------------------------- NOTE: Character Tags
  static const sera = "<sera>";
}

class EndTags {
  static const itatlic = "</i>";
  static const bold = "</b>";
  static const h3 = "</h3>";
  static const h4 = "</h4>";

  // --------------------------- NOTE: Custom Tags

  // --------------------------- NOTE: Character Tags
  static const sera = "</sera>";

  // --------------------------- NOTE: ALL
  static const List<String> allEndTags = [itatlic, bold, h3, h4, sera];
}
