import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class QrBody extends StatelessWidget {
  const QrBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.qr_code_2_rounded, size: 96.sp, color: UIColor.bakcellRed),
            16.verticalSpace,
            Label(
              text: Lng.mainTabGetQr,
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
