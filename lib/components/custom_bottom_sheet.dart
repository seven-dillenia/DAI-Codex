import 'package:dai_codex/misc/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomSheet extends StatefulWidget {
  final bool showTitle;
  final bool isGrid;
  final Function onSwitchChange;
  final Function onGridTap;
  final Function onListTap;

  CustomBottomSheet({
    @required this.isGrid,
    @required this.showTitle,
    @required this.onSwitchChange,
    @required this.onGridTap,
    @required this.onListTap,
  });

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  bool _showTitle = false;
  bool _isGrid = false;

  @override
  void initState() {
    super.initState();
    _showTitle = widget.showTitle;
    _isGrid = widget.isGrid;
  }

  final TextStyle highlighted = Styles.bFancy.copyWith(fontSize: 14, color: Styles.yellow);
  final TextStyle nonHighlighted = Styles.bFancy.copyWith(fontSize: 14);
  final TextStyle disabledTextStyle = Styles.bFancy.copyWith(fontSize: 14, color: Styles.disbaledLightGrey);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Styles.spacing, vertical: Styles.spacing),
      padding: EdgeInsets.fromLTRB(0, Styles.spacing, Styles.spacing, 0),
      decoration: BoxDecoration(
        color: Styles.grey,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [BoxShadow(color: Color(0xff3F4239), offset: Offset(2, 3), blurRadius: 5)],
      ),
      child: Container(
        height: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // ------------------------------------ NOTE: View
            Container(
              margin: EdgeInsets.only(left: Styles.spacing),
              child: Text(
                "TAROT VIEW",
                style: Styles.bFancy
              ),
            ),
            SizedBox(height: Styles.spacing),
            // ------------------------------------ NOTE: Divider
            Container(
              margin: EdgeInsets.only(left: Styles.spacing),
              width: double.maxFinite,
              height: 1,
              color: Styles.yellow,
            ),
            SizedBox(
              height: Styles.spacing * 0.2,
            ),
            // ------------------------------------ NOTE: Grid Icon
            GestureDetector(
              onTap: () {
                if (!this._isGrid) {
                  setState(() {
                    this._isGrid = true;
                  });
                }

                widget.onGridTap();
              },
              child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.fromLTRB(Styles.spacing, Styles.spacing, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Icon(
                            Styles.gridIcon,
                            color: _isGrid ? Styles.yellow : Styles.cloudyWhite,
                          ),
                        ),
                        SizedBox(
                          width: Styles.bigSpacing,
                        ),
                        Container(
                          child: Text(
                            "Grid",
                            style: _isGrid ? this.highlighted : this.nonHighlighted,
                            // style: this.nonHighlighted
                          ),
                        )
                      ],
                    ),
                    // --------------------- NOTE: Check Icon
                    Builder(
                      builder: (context) {
                        if (!this._isGrid) {
                          return SizedBox();
                        } else {
                          return Container(
                            child: Icon(
                              FontAwesomeIcons.check,
                              color: Styles.yellow,
                              size: 18,
                            ),
                          );
                        }
                      },
                    )

                  ],
                ),
              ),
            ),

            // ------------------------------------ NOTE: List Icon
            GestureDetector(
              onTap: () {
                if (this._isGrid) {
                  setState(() {
                    this._isGrid = false;
                  });
                }

                widget.onListTap();
              },
              child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.fromLTRB(Styles.spacing, Styles.spacing, 0, 0),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Styles.listIcon,
                          color: _isGrid ? Styles.cloudyWhite : Styles.yellow,
                        ),
                        SizedBox(
                          width: Styles.bigSpacing,
                        ),
                        Container(
                          child: Text(
                            "List",
                            style: _isGrid ? this.nonHighlighted : this.highlighted,
                          ),
                        )
                      ],
                    ),
                    Builder(
                      builder: (context) {
                        if (this._isGrid) {
                          return SizedBox();
                        } else {
                          return Container(
                            child: Icon(
                              FontAwesomeIcons.check,
                              color: Styles.yellow,
                              size: 18,
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),

            SizedBox(
              height: Styles.spacing,
            ),
            // ------------------------------------ NOTE: Divider
            Container(
              margin: EdgeInsets.only(left: Styles.spacing),
              width: double.maxFinite,
              height: 1,
              color: Styles.yellow,
            ),
            // ------------------------------------ NOTE: Switch Title
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 5),

                  // TODO: add ios switch
                  child: Switch(
                    value: _showTitle,
                    onChanged: this._isGrid ? (value) {
                      setState(() {
                        _showTitle = !_showTitle;
                      });
                      widget.onSwitchChange(value);
                    } : null,
                    activeColor: this._isGrid ? Styles.yellow : Styles.disabledGrey,
                    activeTrackColor: this._isGrid ? Styles.goldenRetriver : Styles.disbaledLightGrey,
                    inactiveThumbColor: this._isGrid ? Styles.white : Styles.disabledGrey,
                    inactiveTrackColor: this._isGrid ? Styles.cloudyWhite : Styles.disbaledLightGrey,

                  ),
                ),
                Container(
                  child: Text(
                    "Show Codex Title",
                    style: !this._isGrid ? this.disabledTextStyle : (this._showTitle ? this.highlighted : this.nonHighlighted),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
