import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class BakcellBrandLabel extends StatelessWidget {
  const BakcellBrandLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Label(
      text: 'bakcell',
      color: UIColor.bakcellRed,
      weight: FontWeight.w800,
      size: 22.sp,
      latterSpacing: -0.5,
    );
  }
}
