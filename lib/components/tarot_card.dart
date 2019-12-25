import 'package:dai_codex/misc/data.dart';
import 'package:dai_codex/misc/styles.dart';
import 'package:dai_codex/models/codex_data.dart';
import 'package:flutter/material.dart';

class TarotCard extends StatefulWidget {
  final CodexData tarot;
  final bool showCodexTitle;
  final Function onTap;
  TarotCard({@required this.tarot, @required this.showCodexTitle, @required this.onTap});

  @override
  _TarotCardState createState() => _TarotCardState();
}

class _TarotCardState extends State<TarotCard> {
  final double minWidth = 160;
  double width = 160;
  final double widthHeightMultiple = 1.6;
  bool _isTapped = false;

  final RadialGradient goldHue = RadialGradient(
    center: Alignment(0.7, -0.6),
    radius: 2,
    colors: [Color(0xFFffe5a0), Color(0xFFe99854)],
    stops: [0.0, 0.5],
  );

  final RadialGradient transHue = RadialGradient(
    center: Alignment(0.7, 0.6),
    colors: [Colors.transparent, Colors.transparent],
  );

  void calcDimensions() {
    double appWidth = MediaQuery.of(context).size.width - (Styles.spacing * 2);
    double numOfCard = (appWidth / minWidth).floorToDouble();
    double rowWidth = (minWidth * numOfCard) +((numOfCard - 1) * Styles.smallSpacing);
    double addtional = (appWidth - rowWidth) / numOfCard;
    double newWidth = minWidth + addtional;

    setState(() {
      this.width = newWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    calcDimensions();
    return GestureDetector(
      onTap: () {
        widget.onTap();

        setState(() {
          this._isTapped = true;
        });

        Future.delayed(Duration(milliseconds: Data.milliSecond), () {
          setState(() {
            this._isTapped = false;
          });
        });
      },
      child: Stack(
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: Data.milliSecond),
            curve: Curves.easeInQuad,
            decoration: BoxDecoration(
              borderRadius: this._isTapped
                  ? BorderRadius.circular(8.0)
                  : BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(35),
                    ),
              boxShadow: [
                BoxShadow(
                    color: this._isTapped ? Styles.goldenRetriver : Color(0xff3F4239),
                    offset: this._isTapped ? Offset(2, 1) : new Offset(1, 1),
                    blurRadius: 5)
              ],
            ),
            child: AnimatedContainer(
              duration: Duration(milliseconds: Data.milliSecond),
              curve: Curves.easeInQuad,
              width: this.width,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: this._isTapped ? Styles.goldenRetriver : Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(8.0),
                gradient: this._isTapped ? this.goldHue : this.transHue,
              ),
              child: Opacity(
                opacity: widget.showCodexTitle ? 0.35 : 0.8,
                child: Image.asset(widget.tarot.tarotPath),
              ),
            ),
          ),
          Builder(
            builder: (context) {
              if (widget.showCodexTitle) {
                return Container(
                  width: this.width,
                  height: this.width * this.widthHeightMultiple,
                  child: Center(
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Opacity(
                            opacity: 0.95,
                            child: Text(
                              widget.tarot.title,
                              style: Styles.h2Fancy.copyWith(shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(2, 3),
                                  blurRadius: 5,
                                  color: Color(0xff8A7530),
                                )
                              ]),
                              textAlign: TextAlign.center,
                            ),
                          ))),
                );
              } else {
                return SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
