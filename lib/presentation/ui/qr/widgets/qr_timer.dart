import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/qr/provider/qr_provider.dart';

class QrTimer extends StatelessWidget {
  const QrTimer({super.key});

  @override
  Widget build(BuildContext context) {
    final seconds =
        context.select<QrProvider, int>((p) => p.remainingSeconds);
    return Label(
      text: _format(seconds),
      size: 14.sp,
      weight: FontWeight.w700,
      color: UIColor.bakcellRed,
      latterSpacing: 0.8,
    );
  }

  String _format(int seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }
}
