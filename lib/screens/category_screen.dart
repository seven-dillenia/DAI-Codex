import 'package:dai_codex/components/custom_sliver_app.dart';
import 'package:dai_codex/components/category_tile.dart';
import 'package:dai_codex/misc/data.dart';
import 'package:dai_codex/misc/styles.dart';
import 'package:dai_codex/screens/tarot_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryScreen extends StatefulWidget {
  static const id = "Category Screen";

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool ableToTap = true;
  void setView() async {
    List<bool> result = await getPrefs();

    if ((result[0] != null) && (result[1] != null)) {
      Data.isGrid = result[0];
      Data.showTitle = result[1];
    }
  }

  Future<List<bool>> getPrefs() {
    return SharedPreferences.getInstance().then((prefs) {
      bool isGrid = prefs.getBool('isGrid');
      bool showTitle = prefs.getBool('showTitle');

      return [isGrid, showTitle];
    });
  }

  @override
  void initState() {
    super.initState();
    setView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.black,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: Styles.spacing),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverPersistentHeader(
                delegate: CustomSliverAppBar(
                  expandedHeight: 200,
                  minHeight: 60,
                  hasBanner: true,
                  margin: EdgeInsets.only(left: 110, top: 10),
                  title: Text("Codex", style: Styles.h1Fancy),
                  captionText: "Stories and background from the world of Thedas",
                  leading: Positioned(
                    bottom: 0,
                    child: Container(
                      height: 200,
                      child: Image.asset('assets/icons/banner.png'),
                    ),
                  ),
                ),
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Wrap(
                      children: Data.categories
                          .map((category) => CategoryTile(
                                text: category.name,
                                ableToTap: this.ableToTap,
                                onTap: () {
                                  if (ableToTap) {
                                    setState(() {
                                      ableToTap = false;
                                    });
                                    Future.delayed(Duration(milliseconds: Data.milliSecond), () {
                                      Navigator.of(context).pushNamed(TarotScreen.id, arguments: category);
                                      setState(() {
                                        this.ableToTap = true;
                                      });
                                    });
                                  }
                                },
                              ))
                          .toList()),
                  SizedBox(height: Styles.bigSpacing)
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
