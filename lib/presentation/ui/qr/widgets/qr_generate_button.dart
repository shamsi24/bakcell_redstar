import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/qr/provider/qr_provider.dart';

class QrGenerateButton extends StatelessWidget {
  const QrGenerateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        onPressed: () {
          HapticFeedback.lightImpact();
          context.read<QrProvider>().generateCode();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: UIColor.bakcellRed,
          foregroundColor: UIColor.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),
        child: Label(
          text: Lng.qrGenerateCode,
          size: 16.sp,
          weight: FontWeight.w700,
          color: UIColor.white,
        ),
      ),
    );
  }
}
