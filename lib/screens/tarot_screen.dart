import 'package:dai_codex/components/category_tile.dart';
import 'package:dai_codex/components/custom_bottom_sheet.dart';
import 'package:dai_codex/components/custom_sliver_app.dart';
import 'package:dai_codex/components/tarot_card.dart';
import 'package:dai_codex/misc/helper.dart';
import 'package:dai_codex/misc/styles.dart';
import 'package:dai_codex/models/category_data.dart';
import 'package:dai_codex/models/codex_data.dart';
import 'package:dai_codex/screens/codex_screen.dart';
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

  // --------------- NOTE: Variables: Card View
  bool isGrid = true;
  bool showTitle = false;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            // -------------------------------------- NOTE: App bar
            SliverPersistentHeader(
              delegate: CustomSliverAppBar(
                  expandedHeight: 60,
                  minHeight: 60,
                  title: Container(
                    child: Text(
                      widget.category.name,
                      style: Styles.h1Fancy.copyWith(height: 0.9),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  leading: Align(
                    alignment: Alignment.centerLeft,
                    // top: Styles.leadingTopMargin,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        FontAwesomeIcons.chevronLeft,
                        color: Styles.yellow,
                      ),
                    ),
                  ),
                  crossAxisAlignment: CrossAxisAlignment.center,

                  // ---------------------------------- NOTE: Card Button
                  actionWidget: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (BuildContext context) {
                              return CustomBottomSheet(
                                isGrid: this.isGrid,
                                showTitle: this.showTitle,
                                onSwitchChange: (value) {
                                  setState(() {
                                    this.showTitle = !this.showTitle;
                                  });
                                },
                                onGridTap: () {
                                  if (!isGrid) {
                                    setState(() {
                                      this.isGrid = true;
                                    });
                                  }
                                },
                                onListTap: () {
                                  if (isGrid) {
                                    setState(() {
                                      this.isGrid = false;
                                    });
                                  }
                                },
                              );
                            });
                      },
                      icon: Icon(
                        FontAwesomeIcons.thLarge,
                        color: Styles.yellow,
                      ),
                    ),
                  )),
              pinned: false,
              floating: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                // SizedBox(height: Styles.bigSpacing),
                // --------------------------------------- NOTE: Tarot Cards
                Builder(
                  builder: (context) {
                    if (this.isGrid) {
                      return Container(
                        child: Wrap(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            spacing: Styles.superSmallSpacing,
                            runSpacing: Styles.superSmallSpacing,
                            children: this
                                ._tarotDataList
                                .map((data) => TarotCard(
                                      showCodexTitle: this.showTitle,
                                      tarot: data,
                                    ))
                                .toList()),
                      );
                    } else {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: Styles.smallSpacing),
                        child: Wrap(
                          children: this
                              ._tarotDataList
                              .map((tarot) => CategoryTile(
                                    text: tarot.title,
                                    onTap: () {
                                      Navigator.of(context).pushNamed(CodexScreen.id, arguments: tarot);
                                    },
                                  ))
                              .toList(),
                        ),
                      );
                    }
                  },
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
