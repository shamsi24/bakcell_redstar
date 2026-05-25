import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class HomeLogo extends StatelessWidget {
  const HomeLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.star,
          color: UIColor.bakcellRed,
          size: 22.sp,
        ),
        6.horizontalSpace,
        Label(
          text: 'club red',
          size: 20.sp,
          weight: FontWeight.w700,
          color: UIColor.bakcellRed,
        ),
      ],
    );
  }
}
