import 'package:dai_codex/misc/styles.dart';
import 'package:dai_codex/models/codex_data.dart';
import 'package:dai_codex/screens/codex_screen.dart';
import 'package:flutter/material.dart';

class TarotCard extends StatefulWidget {
  final CodexData tarot;
  TarotCard({@required this.tarot});

  @override
  _TarotCardState createState() => _TarotCardState();
}

class _TarotCardState extends State<TarotCard> {
  bool _isTapped = false;

  final RadialGradient goldHue =
      RadialGradient(center: Alignment(0.7, -0.6), radius: 2, colors: [Color(0xFFffe5a0), Color(0xFFe99854)], stops: [0.0, 0.5]);

  final RadialGradient transHue = RadialGradient(center: Alignment(0.7, 0.6), colors: [Colors.transparent, Colors.transparent]);

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
          Navigator.of(context).pushNamed(CodexScreen.id, arguments: widget.tarot);
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInQuad,
        decoration: BoxDecoration(
          borderRadius: this._isTapped
              ? BorderRadius.circular(8.0)
              : BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(10), bottomLeft: Radius.circular(10), bottomRight: Radius.circular(35)),
          boxShadow: [
            BoxShadow(
                color: this._isTapped ? Styles.goldenRetriver : Color(0xff3F4239),
                offset: this._isTapped ? Offset(2, 1) : new Offset(2, 3),
                blurRadius: 5)
          ],
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInQuad,
          width: 185,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: this._isTapped ? Styles.goldenRetriver : Colors.transparent),
            borderRadius: BorderRadius.circular(8.0),
            gradient: this._isTapped ? this.goldHue : this.transHue,
          ),
          child: Opacity(
            opacity: 0.8,
            child: Image.asset(widget.tarot.tarotPath),
          ),
        ),
      ),
    );
  }
}
