import 'package:dai_codex/components/custom_sliver_app.dart';
import 'package:dai_codex/components/category_tile.dart';
import 'package:dai_codex/misc/data.dart';
import 'package:dai_codex/misc/styles.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  static const id = "Category Screen";

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.black,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: Styles.smallSpacing),
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
                  SizedBox(height: Styles.bigSpacing),
                  Wrap(
                    children: Data.categories.map((category) => CategoryTile(category: category)).toList(),
                  ),
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
