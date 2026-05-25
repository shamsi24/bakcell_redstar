import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class PartnerOfferDetailsTitle extends StatelessWidget {
  const PartnerOfferDetailsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 12.h),
      child: Label(
        text: Lng.partnerOfferDetails,
        size: 16.sp,
        weight: FontWeight.w700,
        color: UIColor.black,
      ),
    );
  }
}
