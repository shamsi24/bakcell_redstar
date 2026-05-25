import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class PartnersSectionTitle extends StatelessWidget {
  const PartnersSectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 12.h),
      child: Label(
        text: Lng.homePartners,
        size: 20.sp,
        weight: FontWeight.w700,
        color: UIColor.black,
      ),
    );
  }
}
