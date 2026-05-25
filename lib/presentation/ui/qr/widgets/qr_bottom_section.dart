import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/ui/qr/provider/qr_provider.dart';
import 'package:redstar_module/presentation/ui/qr/widgets/qr_disclaimer.dart';
import 'package:redstar_module/presentation/ui/qr/widgets/qr_generate_button.dart';

class QrBottomSection extends StatelessWidget {
  const QrBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isLocked = context.select<QrProvider, bool>((p) => p.isLocked);
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isLocked) ...[
            const QrGenerateButton(),
            16.verticalSpace,
          ],
          const QrDisclaimer(),
        ],
      ),
    );
  }
}
