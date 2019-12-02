import 'package:dai_codex/misc/styles.dart';
import 'package:dai_codex/screens/codex_screen.dart';
import 'package:flutter/material.dart';

class TarotCard extends StatefulWidget {
  final String imagePath;

  TarotCard({@required this.imagePath});

  @override
  _TarotCardState createState() => _TarotCardState();
}

class _TarotCardState extends State<TarotCard> {
  bool _isTapped = false;

  final RadialGradient goldHue = RadialGradient(
      center: Alignment(0.7, -0.6),
      radius: 2,
      colors: [Color(0xFFffe5a0), Color(0xFFe99854)],
      stops: [0.0, 0.5]);

  final RadialGradient transHue = RadialGradient(
    center: Alignment(0.7, 0.6),
    colors: [Colors.transparent, Colors.transparent]
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          this._isTapped = true;
        });

        Future.delayed(Duration(milliseconds: 500), () {
          setState(() {
            this._isTapped = false;
          });
          Navigator.of(context).pushNamed(CodexScreen.id);
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInQuad,
        width: 185,
        decoration: BoxDecoration(
            border:
                Border.all(width: 2, color: this._isTapped ? Styles.shinyGold : Colors.transparent),
            borderRadius: BorderRadius.circular(8.0),
            gradient: this._isTapped ? this.goldHue : this.transHue),
        // color: Colors.red,
        child: Opacity(
          opacity: 0.8,
          child: Image.asset(widget.imagePath),
        ),
      ),
    );
  }
}