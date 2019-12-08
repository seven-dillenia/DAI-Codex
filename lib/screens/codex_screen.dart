import 'package:dai_codex/components/codex_text.dart';
import 'package:dai_codex/components/custom_sliver_app.dart';
import 'package:dai_codex/misc/data.dart';
import 'package:dai_codex/misc/helper.dart';
import 'package:dai_codex/misc/styles.dart';
import 'package:dai_codex/models/codex_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CodexScreen extends StatefulWidget {
  static const id = "Codex Screen";
  final CodexData codexData;

  CodexScreen({@required this.codexData});

  @override
  _CodexScreenState createState() => _CodexScreenState();
}

class _CodexScreenState extends State<CodexScreen> {
  List<String> lines = new List<String>();
  bool isMap = false;

  @override
  void initState() {
    super.initState();

    if (widget.codexData.codexPath.contains('.jpg')) {
      this.isMap = true;
    } else {
      loadText();
    }
  }

  void loadText() {
    Helper.loadMd(context, widget.codexData.codexPath).then((data) {
      setState(() {
        this.lines = data;
      });
    });
  }

  double setExpandedHeight() {
    double appWidth = MediaQuery.of(context).size.width - 100;
    double textWidth = widget.codexData.title.length * 12.457142857142857;

    print("app width: " + appWidth.toString());
    print("text width: " + textWidth.toString());

    if(textWidth > appWidth * 2) {
      return 90;
    } else if (textWidth > appWidth) {
      return 80;
    } else {
      return 60;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: CustomSliverAppBar(
                expandedHeight: setExpandedHeight(),
                minHeight: 60,
                title: Flexible(
                  child: Container(
                    // height: 1,
                    // color: Colors.blue,
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      // longest one line text: "This Is A Very Long Text"
                      widget.codexData.title,
                      style: Styles.h1Fancy.copyWith(height: 0.9, fontSize: 24),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                leading: Positioned(
                  top: Styles.leadingTopMargin,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(Styles.iconPadding),
                      color: Colors.transparent,
                      child: Icon(
                        FontAwesomeIcons.chevronLeft,
                        color: Styles.yellow,
                      ),
                    ),
                  ),
                ),
                crossAxisAlignment: CrossAxisAlignment.center,
              ),
              pinned: false,
              floating: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: Styles.bigSpacing),
                Builder(
                  builder: (context) {
                    if (this.isMap) {
                      if (widget.codexData.title == "Winter Palace") {
                        return Wrap(
                          alignment: WrapAlignment.center,
                          runSpacing: Styles.spacing,
                          children: Data.winterPalaceMap.map((path) => buildMapImage(path)).toList(),
                        );
                      } else {
                        return buildMapImage(widget.codexData.codexPath);
                      }
                    } else {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: Styles.spacing),
                        child: CodexText(
                          lines: this.lines,
                        ),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: Styles.bigSpacing,
                )
              ]),
            )
          ],
        ),
      ),
    );
  }

  Container buildMapImage(String path) {
    return Container(
      constraints: BoxConstraints(maxWidth: 360),
      child: Image.asset(path),
    );
  }
}
