import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class QrDisclaimer extends StatelessWidget {
  const QrDisclaimer({super.key});

  @override
  Widget build(BuildContext context) {
    return Label(
      text: Lng.qrDisclaimer,
      align: TextAlign.center,
      size: 12.sp,
      weight: FontWeight.w400,
      color: UIColor.darkGrey,
      maxLines: 3,
    );
  }
}
