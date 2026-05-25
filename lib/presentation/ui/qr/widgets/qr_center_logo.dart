import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class QrCenterLogo extends StatelessWidget {
  const QrCenterLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52.w,
      height: 52.w,
      padding: EdgeInsets.all(6.w),
      decoration: BoxDecoration(
        color: UIColor.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: UIColor.black.withValues(alpha: 0.06),
            blurRadius: 8,
          ),
        ],
      ),
      child: Image.asset(
        Img.bakcellStars,
        fit: BoxFit.contain,
      ),
    );
  }
}
