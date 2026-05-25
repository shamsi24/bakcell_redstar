import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/partner_detail/model/partner_offer.dart';

class PartnerOfferPeriodBadge extends StatelessWidget {
  final PartnerOfferPeriod period;

  const PartnerOfferPeriodBadge({super.key, required this.period});

  @override
  Widget build(BuildContext context) {
    final label = period == PartnerOfferPeriod.weekly
        ? Lng.partnerWeekly
        : Lng.partnerRegular;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: UIColor.bakcellRed,
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
