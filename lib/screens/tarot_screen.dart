import 'package:dai_codex/components/custom_sliver_app.dart';
import 'package:dai_codex/components/tarot_card.dart';
import 'package:dai_codex/misc/helper.dart';
import 'package:dai_codex/misc/styles.dart';
import 'package:dai_codex/models/category_data.dart';
import 'package:dai_codex/models/codex_data.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TarotScreen extends StatefulWidget {
  static const id = "Tarot Screen";
  final Category category;

  TarotScreen({@required this.category});

  @override
  _TarotScreenState createState() => _TarotScreenState();
}

class _TarotScreenState extends State<TarotScreen> {
  bool isTapped = false;
  List<CodexData> _tarotDataList = new List<CodexData>();

  @override
  void initState() {
    super.initState();
    getTarotData();
  }

  // get all the picture picture
  void getTarotData() {
    Helper.loadAsset(context, widget.category.path).then((data) {
      setState(() {
        this._tarotDataList = CodexData.decodeJsonToTarotDataList(data);
      });
    });
    // read the json
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
                expandedHeight: 50,
                minHeight: 40,
                title: Container(
                  child: Text(
                    widget.category.name,
                    style: Styles.h1Fancy.copyWith(height: 0.9),
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
                  child: Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      spacing: Styles.superSmallSpacing,
                      runSpacing: Styles.superSmallSpacing,
                      children: this
                          ._tarotDataList
                          .map((data) => TarotCard(
                                tarot: data,
                              ))
                          .toList()),
                ),
                SizedBox(height: Styles.bigSpacing)
              ]),
            )
          ],
        ),
      ),
    );
  }
}
