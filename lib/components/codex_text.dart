import 'package:dai_codex/misc/styles.dart';
import 'package:flutter/material.dart';

// TODO: make enums for endtags and start tags
class CodexText extends StatelessWidget {
  final List<String> lines;
  final List<String> endTags = ["</i>", "</sera>", "</h3>", "</b>"];

  final Widget division = Divider(
    color: Styles.white,
  );

  CodexText({@required this.lines});

  List<Widget> buildLines() {
    List<Widget> widgets = new List<Widget>();
    TextStyle _spanStyle = Styles.p;

    // Loop through each lines
    // Start at 2 so the h1 and the <br> under it won't show up
    for (int i = 2; i < lines.length; i++) {
      String oneLine = lines[i];
      List<String> words = oneLine.split(" ");
      List<TextSpan> spans = new List<TextSpan>();
      bool hasDivision = false;

      // Loop through each word
      // Skip blank lines
      if (lines[i].isNotEmpty) {
        for (int j = 0; j < words.length; j++) {
          switch (words[j]) {
            case "<i>":
              _spanStyle = Styles.i;
              break;
            case "<h3>":
              _spanStyle = Styles.h3;
              break;
            case "<b>":
              _spanStyle = Styles.bold;
              i++;
              break;
            case "<sera>":
              _spanStyle = Styles.sera;
              break;
            case "<division>":
              hasDivision = true;
              break;

            default:
              if (endTags.contains(words[j])) {
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
