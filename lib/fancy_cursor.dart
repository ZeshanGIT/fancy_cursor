library fancy_cursor;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FancyCursor extends StatefulWidget {
  final Widget child;

  const FancyCursor({Key key, this.child}) : super(key: key);

  @override
  _FancyCursorState createState() => _FancyCursorState();
}

class _FancyCursorState extends State<FancyCursor> {
  Offset position = Offset.zero;

  @override
  void initState() {
    super.initState();
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
          AnimatedPositioned(
            duration: Duration(milliseconds: 800),
            curve: Curves.elasticOut,
            top: position.dy - 8,
            left: position.dx - 8,
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(8)),
                height: 16,
                width: 16,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 800),
            curve: Curves.elasticOut,
            top: position.dy - 4,
            left: position.dx - 4,
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8)),
                height: 8,
                width: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
