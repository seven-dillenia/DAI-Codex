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
    int textWidth = widget.codexData.title.length * 10;

    if (textWidth > appWidth) {
      return 60;
    } else {
      return 50;
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
                minHeight: 36,
                title: Flexible(
                  child: Container(
                    // height: 1,
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      widget.codexData.title,
                      style: Styles.h1Fancy.copyWith(height: 0.9, fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                leading: Positioned(
                  top: 0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      FontAwesomeIcons.chevronLeft,
                      color: Colors.white,
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
                          runSpacing: Styles.smallSpacing,
                          children: Data.winterPalaceMap.map((path) => buildMapImage(path)).toList(),
                        );
                      } else {
                        return buildMapImage(widget.codexData.codexPath);
                      }
                    } else {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: Styles.smallSpacing),
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
