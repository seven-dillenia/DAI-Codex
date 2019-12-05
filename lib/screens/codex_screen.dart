import 'package:dai_codex/components/codex_text.dart';
import 'package:dai_codex/components/custom_sliver_app.dart';
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
  double expandedHeight = 0;

  @override
  void initState() {
    super.initState();
    loadText();
    setExpandedHeight();
  }

  void loadText() {
    Helper.loadMd(context, widget.codexData.codexPath).then((data) {
      setState(() {
        this.lines = data;
      });
    });
  }

  void setExpandedHeight() {
    if(widget.codexData.title.length <= 20) {
      expandedHeight = 50;
    } else if (widget.codexData.title.length <= 40) {
      expandedHeight = 70;
    } else {
      expandedHeight = 90;
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
                expandedHeight: this.expandedHeight,
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
                Container(
                    margin: EdgeInsets.symmetric(horizontal: Styles.smallSpacing),
                    child: CodexText(
                      lines: this.lines,
                    )),
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
}
