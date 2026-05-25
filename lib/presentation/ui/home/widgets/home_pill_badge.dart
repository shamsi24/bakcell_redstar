import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class HomePillBadge extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;

  final bool isWeeklyTag;

  const HomePillBadge({
    super.key,
    required this.text,
    this.backgroundColor = UIColor.bakcellRed,
    this.textColor = UIColor.white,
    this.fontSize = 11,
    this.fontWeight = FontWeight.w600,
    this.isWeeklyTag = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        gradient: isWeeklyTag
            ? null
            : LinearGradient(
                colors: [UIColor.bakcellRed, UIColor.bakcellLightRed]),
        color: isWeeklyTag ? UIColor.bakcellRed : null,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Label(
        text: text,
        size: fontSize.sp,
        weight: fontWeight,
        color: textColor,
      ),
    );
  }
}
