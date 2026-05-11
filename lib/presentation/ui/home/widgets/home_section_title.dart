import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class HomeSectionTitle extends StatelessWidget {
  final String text;

  const HomeSectionTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Label(
        text: text,
        size: 18.sp,
        weight: FontWeight.w700,
        color: UIColor.black,
      ),
    );
  }
}
