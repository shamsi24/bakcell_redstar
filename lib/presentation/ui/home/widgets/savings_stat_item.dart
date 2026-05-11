import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class SavingsStatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const SavingsStatItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: UIColor.black, size: 22.sp),
        10.vertical,
        Label(
          text: label,
          size: 13.sp,
          color: UIColor.darkGrey,
          weight: FontWeight.w400,
        ),
        4.vertical,
        Label(
          text: value,
          size: 18.sp,
          color: UIColor.black,
          weight: FontWeight.w700,
        ),
      ],
    );
  }
}
