import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/qr/provider/qr_provider.dart';
import 'package:redstar_module/presentation/ui/qr/widgets/qr_active_view.dart';
import 'package:redstar_module/presentation/ui/qr/widgets/qr_locked_view.dart';
import 'package:redstar_module/presentation/ui/qr/widgets/qr_timer.dart';

class QrCodeCard extends StatelessWidget {
  const QrCodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final code = context.select<QrProvider, String?>((p) => p.generatedCode);
    final isLocked = code == null;
    return Center(
      child: Container(
        width: 240.w,
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: UIColor.bakcellRedTint,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: ColoredBox(
                  color: UIColor.white,
                  child: isLocked
                      ? const QrLockedView()
                      : QrActiveView(code: code),
                ),
              ),
            ),
            12.verticalSpace,
            const QrTimer(),
          ],
        ),
      ),
    );
  }
}
