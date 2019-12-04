import 'package:dai_codex/misc/styles.dart';
import 'package:dai_codex/screens/tarot_screen.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatefulWidget {
  final text;
  CategoryTile({@required this.text});

  @override
  _CategoryTileState createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  bool _istapped = false;
  final LinearGradient _gradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0, 0.5, 1],
    colors: [
      Color(0xFFa15322),
      Color(0xFFe99854),
      Color(0xFFffe5a0),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          this._istapped = true;
        });

        Future.delayed(Duration(milliseconds: 500), () {
          setState(() {
            this._istapped = false;
          });
          Navigator.of(context).pushNamed(TarotScreen.id);
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInQuad,
        padding: EdgeInsets.symmetric(vertical: Styles.bigSpacing),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Styles.black,
          border: Border(bottom: BorderSide(width: 2, color: Styles.goldenBrown)),
          gradient: this._istapped ? this._gradient : null,
        ),
        child: Text(
          widget.text,
          style: Styles.h2Fancy,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
