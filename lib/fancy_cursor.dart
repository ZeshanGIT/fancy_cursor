library fancy_cursor;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FancyCursor extends StatefulWidget {
  final Widget child;
  Color color, trailColor;
  double size, trailSize;
  Duration delay, trailDelay;
  Curve curve, trailCurve;
  Widget customCursor, trailCustomCursor;
  bool trail;
  double trailOpacity;
  GlobalKey customCursorKey = GlobalKey();
  GlobalKey trailCustomCursorKey = GlobalKey();

  FancyCursor({
    Key key,
    @required this.child,
    this.trail = true,
    this.color,
    this.size,
    this.delay,
    this.curve,
    this.customCursor,
    this.trailColor,
    this.trailSize,
    this.trailDelay,
    this.trailCurve,
    this.trailOpacity,
    this.trailCustomCursor,
  }) : super(key: key) {
    this.delay ??= const Duration();
    this.curve ??= Curves.elasticOut;

    this.trailDelay ??= this.delay + Duration(milliseconds: 300);
    this.trailCurve ??= this.curve;

    if (this.customCursor != null) {
      assert(this.color == null && this.size == null);
      this.trailCustomCursor ??= Opacity(
        opacity: this.trailOpacity ?? 0.3,
        child: Transform.scale(
          scale: this.trailSize ?? 1.2,
          child: this.customCursor,
        ),
      );
    } else {
      this.color ??= Colors.black;
      this.size ??= 8;

      if (this.trailCustomCursor != null) {
        assert(this.trailColor == null && this.trailSize == null);
      } else {
        this.trailColor ??= this.color.withOpacity(0.3);
        this.trailSize ??= this.size * 1.5;
      }
    }
  }

  @override
  _FancyCursorState createState() => _FancyCursorState();
}

class _FancyCursorState extends State<FancyCursor> {
  Offset position = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: MouseRegion(
        cursor: SystemMouseCursors.none,
        onHover: (phe) {
          setState(() => position = phe.position);
        },
        child: Stack(
          children: [
            widget.child,
            if (widget.trail)
              AnimatedPositioned(
                duration: widget.trailDelay,
                curve: widget.trailCurve,
                top: position.dy - ((widget.trailSize ?? 0) / 2),
                left: position.dx - ((widget.trailSize ?? 0) / 2),
                child: IgnorePointer(
                  child: widget.trailCustomCursor ??
                      Container(
                        decoration: BoxDecoration(
                          color: widget.trailColor,
                          borderRadius:
                              BorderRadius.circular(widget.trailSize / 2),
                        ),
                        height: widget.trailSize,
                        width: widget.trailSize,
                      ),
                ),
              ),
            AnimatedPositioned(
              duration: widget.delay,
              curve: widget.curve,
              top: position.dy - (widget.size ?? 0) / 2,
              left: position.dx - (widget.size ?? 0) / 2,
              child: IgnorePointer(
                child: widget.customCursor ??
                    Container(
                      decoration: BoxDecoration(
                        color: widget.color,
                        borderRadius: BorderRadius.circular(widget.size / 2),
                      ),
                      height: widget.size,
                      width: widget.size,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
