import 'package:dai_codex/misc/styles.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double minHeight;
  final bool hasBanner;
  final EdgeInsets margin;
  final String captionText;
  final Widget leading;
  final CrossAxisAlignment crossAxisAlignment;
  final Widget title;

  double opacity = 1;

  CustomSliverAppBar({
    @required this.expandedHeight,
    @required this.minHeight,
    @required this.leading,
    @required this.title,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.captionText,
    this.margin,
    this.hasBanner = false,
  });

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    if (this.hasBanner) {
      opacity = (1 - shrinkOffset / 100) < 0 ? 0 : (1 - shrinkOffset / 100);
    }

    return Container(
      color: Styles.black,
      child: Stack(
        overflow: Overflow.visible,
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: this.margin,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: this.crossAxisAlignment,
                children: <Widget>[
                  this.title,
                  Builder(
                    builder: (context) {
                      if (captionText != null) {
                        return Opacity(
                          opacity: opacity,
                          child: Text(
                            this.captionText,
                            style: Styles.caption,
                          ),
                        );
                      }

                      return Container();
                    },
                  )
                ],
              ),
            ),
          ),
          this.leading
        ],
      ),
    );
  }
}
