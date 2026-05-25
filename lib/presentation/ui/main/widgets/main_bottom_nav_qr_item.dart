import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class MainBottomNavQrItem extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const MainBottomNavQrItem({
    super.key,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14.r),
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: UIColor.bakcellRed,
                borderRadius: BorderRadius.circular(12.r),
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                Img.scan,
                height: 24.h,
                colorFilter: ColorFilter.mode(UIColor.white, BlendMode.srcIn),
              ),
            ),
            6.verticalSpace,
            Label(
              text: label,
              size: 10.sp,
              weight: FontWeight.w600,
              color: UIColor.bakcellRed,
            ),
          ],
        ),
      ),
    );
  }
}
