import 'package:dai_codex/components/category_tile.dart';
import 'package:dai_codex/components/custom_bottom_sheet.dart';
import 'package:dai_codex/components/custom_sliver_app.dart';
import 'package:dai_codex/components/tarot_card.dart';
import 'package:dai_codex/misc/data.dart';
import 'package:dai_codex/misc/helper.dart';
import 'package:dai_codex/misc/styles.dart';
import 'package:dai_codex/models/category_data.dart';
import 'package:dai_codex/models/codex_data.dart';
import 'package:dai_codex/screens/codex_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TarotScreen extends StatefulWidget {
  static const id = "Tarot Screen";
  final Category category;

  TarotScreen({@required this.category});

  @override
  _TarotScreenState createState() => _TarotScreenState();
}

class _TarotScreenState extends State<TarotScreen> {
  bool isTapped = false;
  bool ableToTap = true;
  List<CodexData> _tarotDataList = new List<CodexData>();

  // --------------- NOTE: Variables: Card View
  bool isGrid;
  bool showTitle;

  @override
  void initState() {
    super.initState();
    isGrid = Data.isGrid;
    showTitle = Data.showTitle;
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

  void saveIsGrid() async {
    // save to data
    Data.isGrid = this.isGrid;
    Data.showTitle = this.showTitle;

    // save to app
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Future.wait([prefs.setBool('isGrid', this.isGrid), prefs.setBool('showTitle', this.showTitle)]).then((value) {
      print("done");
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: EdgeInsets.all(Styles.iconPadding),
                        child: Icon(
                          FontAwesomeIcons.chevronLeft,
                          color: Styles.yellow,
                        ),
                      ),
                    ),
                  ),
                  crossAxisAlignment: CrossAxisAlignment.center,

                  // ---------------------------------- NOTE: Card Button
                  actionWidget: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet<dynamic>(
                            context: context,
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return CustomBottomSheet(
                                isGrid: this.isGrid,
                                showTitle: this.showTitle,
                                onSwitchChange: (value) {
                                  setState(() {
                                    this.showTitle = !this.showTitle;
                                  });

                                  saveIsGrid();
                                },
                                onGridTap: () {
                                  if (!isGrid) {
                                    setState(() {
                                      this.isGrid = true;
                                    });

                                    saveIsGrid();
                                  }
                                },
                                onListTap: () {
                                  if (isGrid) {
                                    setState(() {
                                      this.isGrid = false;
                                    });
                                    saveIsGrid();
                                  }
                                },
                              );
                            });
                      },
                      child: Container(
                        padding: EdgeInsets.all(Styles.iconPadding),
                        child: Icon(
                          this.isGrid ? Styles.gridIcon : Styles.listIcon,
                          color: Styles.yellow,
                        ),
                      ),
                    ),
                  )),
              pinned: false,
              floating: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                // --------------------------------------- NOTE: Tarot Cards
                Builder(
                  builder: (context) {
                    if (this.isGrid) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: Styles.spacing, vertical: Styles.spacing),
                        child: Wrap(
                            direction: Axis.horizontal,
                            spacing: Styles.smallSpacing,
                            runSpacing: Styles.smallSpacing,
                            children: this
                                ._tarotDataList
                                .map((tarot) => TarotCard(
                                      showCodexTitle: this.showTitle,
                                      tarot: tarot,
                                      onTap: () {
                                        if (ableToTap) {
                                          setState(() {
                                            this.ableToTap = false;
                                          });

                                          Future.delayed(Duration(milliseconds: Data.milliSecond), () {
                                            Navigator.of(context).pushNamed(CodexScreen.id, arguments: tarot);

                                            setState(() {
                                              this.ableToTap = true;
                                            });
                                          });
                                        }
                                      },
                                    ))
                                .toList()),
                      );
                    } else {
                      return Container(
                        margin: EdgeInsets.fromLTRB(Styles.spacing, 0, Styles.spacing, Styles.spacing),
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
              ]),
            )
          ],
        ),
      ),
    );
  }
}
