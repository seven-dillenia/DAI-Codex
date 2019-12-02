import 'package:dai_codex/components/custom_sliver_app.dart';
import 'package:dai_codex/components/tarot_card.dart';
import 'package:dai_codex/misc/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TarotScreen extends StatefulWidget {
  static const id = "Tarot Screen";
  @override
  _TarotScreenState createState() => _TarotScreenState();
}

class _TarotScreenState extends State<TarotScreen> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              delegate: CustomSliverAppBar(
                expandedHeight: 70,
                minHeight: 70,
                headerText: "Character",
                leading: Align(
                  alignment: Alignment.centerLeft,
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
                    children: <Widget>[
                      TarotCard(
                        imagePath: "assets/tarots/characters/cass.png",
                      ),
                      Container(
                        width: 185,
                        // color: Colors.blue,
                        child: Image.asset('assets/tarots/characters/cass.png'),
                      ),
                      Container(
                        width: 185,
                        color: Colors.red,
                        child: Image.asset('assets/tarots/characters/cass.png'),
                      ),
                      Container(
                        width: 185,
                        color: Colors.blue,
                        child: Image.asset('assets/tarots/characters/cass.png'),
                      )
                    ],
                  ),
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
