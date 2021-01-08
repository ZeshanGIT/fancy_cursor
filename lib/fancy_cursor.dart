library fancy_cursor;

import 'package:after_layout/after_layout.dart';
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
  GlobalKey cursorKey = GlobalKey();
  GlobalKey trailCursorKey = GlobalKey();

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
    this.delay ??= const Duration(milliseconds: 300);
    this.curve ??= Curves.elasticOut;

    this.trailDelay ??= this.delay + Duration(milliseconds: 300);
    this.trailCurve ??= this.curve;

    if (customCursor != null) {
      print('Custom cursor');
      assert(this.color == null && this.size == null);

      print('Setting trail custom cursor from custom cursor');
      this.trailCustomCursor ??= Opacity(
        opacity: this.trailOpacity ?? 0.3,
        child: Transform.scale(
          scale: this.trailSize ?? 1.2,
          child: this.customCursor,
        ),
      );
    } else {
      print('No custom cursor');
      print('Setting default cursor attributes');
      this.color ??= Colors.black;
      this.size ??= 8;

      if (this.trailCustomCursor != null) {
        print('Trail custom cursor');
        if (this.customCursor == null)
          assert(this.trailColor == null && this.trailSize == null);
        this.trailCustomCursor = Container(
          key: trailCursorKey,
          child: this.trailCustomCursor,
        );
      } else {
        print('No trail custom cursor');
        print('');
        this.trailColor ??= this.color.withOpacity(0.3);
        this.trailSize ??= this.size * 1.5;
      }
    }
  }

  @override
  _FancyCursorState createState() => _FancyCursorState();
}

class _FancyCursorState extends State<FancyCursor> with AfterLayoutMixin {
  Offset position = Offset.zero;

  Size customCursorSize = Size.zero;
  Size trailCustomCursorSize = Size.zero;

  @override
  void afterFirstLayout(BuildContext context) {
    // setState(() {
    //   customCursorSize =
    // });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
                        borderRadius: BorderRadius.circular(widget.size / 2)),
                    height: widget.size,
                    width: widget.size,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

// {
//   // if (cursor != null) {
//   //   assert(this.color == null &&
//   //       this.size == null &&
//   //       this.delay == null &&
//   //       this.curve == null &&
//   //       this.customCursor == null);
//   // } else
//   // this.cursor = CursorProps(
//   // this.color = cursor.color ?? Colors.black;
//   // this.size = cursor.size ?? 8;
//   // this.delay = cursor.size ?? const Duration(milliseconds: 300);
//   // this.curve = cursor.curve ?? Curves.elasticOut;
//   // this.customCursor = cursor.customCursor;
//   // );

//   // if (overlay) {
//   //   if (overlayCursor != null) {
//   //     assert(this.overlayColor == null &&
//   //         this.overlaySize == null &&
//   //         this.overlayDelay == null &&
//   //         this.overlayCurve == null &&
//   //         this.overlayCustomCursor == null);
//   //   } else {
//   //     this.overlayCursor = new CursorProps(
//   //       color: cursor.color.withOpacity(0.5),
//   //       size: cursor.size * 2,
//   //       delay: cursor.delay + Duration(milliseconds: 300),
//   //       curve: cursor.curve,
//   //       customCursor: cursor.customCursor ??
//   //           Opacity(
//   //             opacity: 0.2,
//   //             child: Transform.scale(
//   //               scale: 1.2,
//   //               child: cursor.customCursor,
//   //             ),
//   //           ),
//   //     );
//   //   }
//   // } else {
//   //   assert(overlaySize == null &&
//   //       overlayColor == null &&
//   //       overlayCurve == null &&
//   //       overlayCustomCursor == null &&
//   //       overlayDelay == null &&
//   //       overlayCursor == null);
//   // }
// }

// FancyCursor.props(
//     {@required this.child,
//     CursorProps cursor,
//     CursorProps overlayCursor,
// //     bool overlay = true}) {
//   if (overlay) {
//     this.overlayColor ??= this.color.withOpacity(0.2);
//     this.overlaySize ??= this.size * 2;
//     this.overlayDelay ??= this.delay + Duration(milliseconds: 300);
//     this.overlayCurve ??= this.curve;
//     this.overlayCustomCursor ??= this.customCursor ??
//         Opacity(
//           opacity: 0.2,
//           child: Transform.scale(
//             scale: 1.2,
//             child: this.customCursor,
//           ),
//         );
//   } else {
//     assert(overlaySize == null &&
//         overlayColor == null &&
//         overlayCurve == null &&
//         overlayCustomCursor == null &&
//         overlayDelay == null);
//   }
// }
