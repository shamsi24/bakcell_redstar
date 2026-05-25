import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class QrCodeText extends StatelessWidget {
  final String code;

  const QrCodeText({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return Label(
      text: code,
      size: 22.sp,
      weight: FontWeight.w800,
      color: UIColor.black,
      latterSpacing: 1.2,
    );
  }
}
