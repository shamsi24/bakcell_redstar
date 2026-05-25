import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class PartnerOfferDiscountBadge extends StatelessWidget {
  final String label;
  final bool isRedeemed;

  const PartnerOfferDiscountBadge({
    super.key,
    required this.label,
    this.isRedeemed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: isRedeemed ? UIColor.darkGrey : UIColor.bakcellRed,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Label(
        text: label,
        size: 11.sp,
        weight: FontWeight.w700,
        color: UIColor.white,
      ),
    );
  }
}
