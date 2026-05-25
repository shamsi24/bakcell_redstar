import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class PartnerDiscountBadge extends StatelessWidget {
  final String label;

  const PartnerDiscountBadge({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: UIColor.bakcellRedTint,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Label(
        text: label,
        size: 14.sp,
        weight: FontWeight.w700,
        color: UIColor.primaryTextColor,
      ),
    );
  }
}
