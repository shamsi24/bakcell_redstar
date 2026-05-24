import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class HomeSeeAllButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const HomeSeeAllButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6.r),
      onTap: () {
        HapticFeedback.lightImpact();
        onPressed?.call();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        child: Label(
          text: Lng.homeSeeAll,
          size: 14.sp,
          weight: FontWeight.w600,
          color: UIColor.bakcellRed,
        ),
      ),
    );
  }
}
