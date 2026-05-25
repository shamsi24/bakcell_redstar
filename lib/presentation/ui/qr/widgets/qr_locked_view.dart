import 'dart:math';

import 'package:flutter/material.dart';
import 'package:redstar_module/presentation/ui/qr/widgets/qr_center_logo.dart';

class QrLockedView extends StatelessWidget {
  const QrLockedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: _QrNoisePainter(),
          ),
        ),
        const QrCenterLogo(),
      ],
    );
  }
}

class _QrNoisePainter extends CustomPainter {
  static const int _seed = 7;
  static const double _cellSize = 6.0;

  @override
  void paint(Canvas canvas, Size size) {
    final random = Random(_seed);
    final background = Paint()..color = const Color(0xffE9E9E9);
    canvas.drawRect(Offset.zero & size, background);

    final paint = Paint();
    for (double x = 0; x < size.width; x += _cellSize) {
      for (double y = 0; y < size.height; y += _cellSize) {
        final shade = 0.55 + random.nextDouble() * 0.35;
        final value = (shade * 255).toInt();
        paint.color = Color.fromARGB(255, value, value, value);
        canvas.drawRect(
          Rect.fromLTWH(x, y, _cellSize, _cellSize),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(_QrNoisePainter old) => false;
}
