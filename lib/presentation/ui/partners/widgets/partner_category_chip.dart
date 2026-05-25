import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/partners/model/partner_category.dart';

class PartnerCategoryChip extends StatelessWidget {
  final PartnerCategory category;
  final bool isSelected;
  final VoidCallback onTap;

  const PartnerCategoryChip({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final background =
        isSelected ? const Color(0xff1A0508) : UIColor.bakcellRedTint;
    final iconColor = isSelected ? UIColor.white : UIColor.bakcellRed;
    final textColor = isSelected ? UIColor.white : UIColor.black;
    return Material(
      color: background,
      borderRadius: BorderRadius.circular(10.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.r),
        onTap: () {
          HapticFeedback.lightImpact();
          onTap();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(category.icon, color: iconColor, size: 18.sp),
              8.horizontalSpace,
              Label(
                text: category.label,
                size: 13.sp,
                weight: FontWeight.w500,
                color: textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
