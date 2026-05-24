import 'package:flutter/material.dart';

class QrBrandIcon extends StatelessWidget {
  final double size;
  final Color color;

  const QrBrandIcon({
    super.key,
    required this.size,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: CustomPaint(
        painter: _QrBrandPainter(color: color),
      ),
    );
  }
}

class _QrBrandPainter extends CustomPainter {
  final Color color;

  _QrBrandPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final w = size.width;
    final h = size.height;
    final barHeight = h * 0.36;
    final gap = h * 0.06;

    final topRect = RRect.fromLTRBAndCorners(
      0,
      (h - 2 * barHeight - gap) / 2,
      w,
      (h - 2 * barHeight - gap) / 2 + barHeight,
      topLeft: Radius.circular(barHeight * 0.32),
      topRight: Radius.circular(barHeight * 0.32),
      bottomLeft: Radius.circular(barHeight * 0.7),
      bottomRight: Radius.circular(barHeight * 0.7),
    );

    final bottomRect = RRect.fromLTRBAndCorners(
      0,
      (h + gap) / 2,
      w,
      (h + gap) / 2 + barHeight,
      topLeft: Radius.circular(barHeight * 0.7),
      topRight: Radius.circular(barHeight * 0.7),
      bottomLeft: Radius.circular(barHeight * 0.32),
      bottomRight: Radius.circular(barHeight * 0.32),
    );

    canvas.drawRRect(topRect, paint);
    canvas.drawRRect(bottomRect, paint);
  }

  @override
  bool shouldRepaint(_QrBrandPainter old) => old.color != color;
}
