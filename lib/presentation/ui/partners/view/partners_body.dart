import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class PartnersBody extends StatelessWidget {
  const PartnersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.storefront_outlined, size: 96.sp, color: UIColor.bakcellRed),
            16.verticalSpace,
            Label(
              text: Lng.mainTabPartners,
              size: 20.sp,
              weight: FontWeight.w700,
              color: UIColor.black,
            ),
          ],
        ),
      ),
    );
  }
}
