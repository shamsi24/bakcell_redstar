import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class MainBottomNavItem extends StatelessWidget {
  final String icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const MainBottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? UIColor.bakcellRed : UIColor.darkGrey;
    return InkWell(
      borderRadius: BorderRadius.circular(12.r),
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(icon,
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                height: 26.h),
            6.verticalSpace,
            Label(
              text: label,
              size: 11.sp,
              weight: isActive ? FontWeight.w600 : FontWeight.w400,
              color: color,
            ),
          ],
        ),
      ),
    );
  }
}
