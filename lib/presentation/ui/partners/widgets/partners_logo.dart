import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class PartnersLogo extends StatelessWidget {
  const PartnersLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.local_florist,
          color: UIColor.bakcellRed,
          size: 22.sp,
        ),
        6.horizontalSpace,
        Label(
          text: 'red star',
          size: 20.sp,
          weight: FontWeight.w700,
          color: UIColor.bakcellRed,
        ),
      ],
    );
  }
}
