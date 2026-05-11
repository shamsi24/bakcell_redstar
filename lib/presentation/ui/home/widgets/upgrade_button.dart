import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class UpgradeButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const UpgradeButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: ElevatedButton(
        onPressed: () {
          HapticFeedback.lightImpact();
          onPressed?.call();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: UIColor.bakcellRed,
          foregroundColor: UIColor.white,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Label(
          text: 'Upgrade',
          color: UIColor.white,
          weight: FontWeight.w600,
          size: 14.sp,
        ),
      ),
    );
  }
}
