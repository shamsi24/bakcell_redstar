import 'package:flutter/material.dart';

class TicketCardClipper extends CustomClipper<Path> {
  final double borderRadius;
  final double notchRadius;
  final double notchY;

  TicketCardClipper({
    required this.borderRadius,
    required this.notchRadius,
    required this.notchY,
  });

  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    final br = borderRadius;
    final nr = notchRadius;

    final path = Path();

    path.moveTo(br, 0);
    path.lineTo(w - br, 0);
    path.arcToPoint(
      Offset(w, br),
      radius: Radius.circular(br),
    );
    path.lineTo(w, notchY - nr);
    path.arcToPoint(
      Offset(w, notchY + nr),
      radius: Radius.circular(nr),
      clockwise: false,
    );
    path.lineTo(w, h - br);
    path.arcToPoint(
      Offset(w - br, h),
      radius: Radius.circular(br),
    );
    path.lineTo(br, h);
    path.arcToPoint(
      Offset(0, h - br),
      radius: Radius.circular(br),
    );
    path.lineTo(0, notchY + nr);
    path.arcToPoint(
      Offset(0, notchY - nr),
      radius: Radius.circular(nr),
      clockwise: false,
    );
    path.lineTo(0, br);
    path.arcToPoint(
      Offset(br, 0),
      radius: Radius.circular(br),
    );
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TicketCardClipper old) =>
      old.borderRadius != borderRadius ||
      old.notchRadius != notchRadius ||
      old.notchY != notchY;
}
