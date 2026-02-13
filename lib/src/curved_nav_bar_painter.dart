import 'package:flutter/material.dart';

/// Custom painter that draws the curved bottom navigation bar
class CurvedNavBarPainter extends CustomPainter {
  final int selectedIndex;
  final int itemCount;
  final Color? color;
  final Gradient? gradient;
  final Color shadowColor;
  final double curveDepth;
  final double topOffset;

  CurvedNavBarPainter({
    required this.selectedIndex,
    required this.itemCount,
    required this.shadowColor,
    this.color,
    this.gradient,
    this.curveDepth = 35.0,
    this.topOffset = 20.0,
  }) : assert(color != null || gradient != null, 
            'Either color or gradient must be provided');

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final itemWidth = size.width / itemCount;
    final curveStartX = (selectedIndex * itemWidth);
    final curveEndX = curveStartX + itemWidth;

    // Start from left
    path.moveTo(0, topOffset);

    // Line to curve start
    path.lineTo(curveStartX, topOffset);

    // Create the curve for the floating button
    path.quadraticBezierTo(
      curveStartX + (itemWidth * 0.25),
      topOffset,
      curveStartX + (itemWidth * 0.35),
      0,
    );

    path.quadraticBezierTo(
      curveStartX + (itemWidth * 0.5),
      -curveDepth,
      curveStartX + (itemWidth * 0.65),
      0,
    );

    path.quadraticBezierTo(
      curveStartX + (itemWidth * 0.75),
      topOffset,
      curveEndX,
      topOffset,
    );

    // Line to right edge
    path.lineTo(size.width, topOffset);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    // Draw shadow
    final shadowPaint = Paint()
      ..color = shadowColor
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);
    canvas.drawPath(path, shadowPaint);

    // Draw nav bar with gradient or solid color
    final paint = Paint()..style = PaintingStyle.fill;
    
    if (gradient != null) {
      paint.shader = gradient!.createShader(
        Rect.fromLTWH(0, 0, size.width, size.height),
      );
    } else {
      paint.color = color!;
    }
    
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CurvedNavBarPainter oldDelegate) {
    return oldDelegate.selectedIndex != selectedIndex ||
        oldDelegate.color != color ||
        oldDelegate.gradient != gradient;
  }
}
