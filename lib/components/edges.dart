import 'package:flutter/material.dart';

/// Default edges for components
class OptrEdges extends StatelessWidget {
  /// Widget child
  final Widget child;

  /// Edge color
  final Color color;

  /// Sharpness of the corners
  final EdgeCorners corners;

  /// Constructor
  const OptrEdges(
      {Key key,
      @required this.child,
      this.color = Colors.cyan,
      this.corners = const EdgeCorners.only(5, 5, 5, 5)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (corners == null) corners = EdgeCorners.only(25, 25, 0, 40);
    return ClipPath(
      clipper: ShapeBorderClipper(
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(corners.topLeft),
                topRight: Radius.circular(corners.topRight),
                bottomRight: Radius.circular(corners.bottomRight),
                bottomLeft: Radius.circular(corners.bottomLeft))),
      ),
      child: Container(child: child, decoration: BoxDecoration(color: color)),
    );
  }
}

/// Helper for edge corners
class EdgeCorners {
  /// Top left corner
  final double topLeft;

  /// Top right corner
  final double topRight;

  /// Bottom right corner
  final double bottomRight;

  /// Bottom left corner
  final double bottomLeft;

  /// Constructor
  const EdgeCorners({
    this.topLeft = 0,
    this.topRight = 0,
    this.bottomLeft = 0,
    this.bottomRight = 0,
  });

  /// Creates edge corners by setting eacy corner individually
  const EdgeCorners.only(
      double topRight, double topLeft, double bottomRight, double bottomLeft)
      : this(
            topLeft: topLeft,
            topRight: topRight,
            bottomLeft: bottomLeft,
            bottomRight: bottomRight);

  /// Creates cross axis edge corners
  const EdgeCorners.cross(double topToBottom, double bottomToTop)
      : this.only(topToBottom, bottomToTop, bottomToTop, topToBottom);
}