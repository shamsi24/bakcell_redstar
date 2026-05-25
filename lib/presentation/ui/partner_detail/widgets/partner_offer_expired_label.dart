import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class PartnerOfferExpiredLabel extends StatelessWidget {
  const PartnerOfferExpiredLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      child: Center(
        child: Label(
          text: Lng.partnerExpired,
          size: 18.sp,
          weight: FontWeight.w800,
          color: UIColor.primaryTextColor,
        ),
      ),
    );
  }
}
