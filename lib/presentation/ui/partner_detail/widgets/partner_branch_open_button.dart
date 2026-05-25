import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class PartnerBranchOpenButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PartnerBranchOpenButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8.r),
      onTap: () {
        HapticFeedback.lightImpact();
        onPressed();
      },
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Icon(
          Icons.send_rounded,
          color: UIColor.black,
          size: 20.sp,
        ),
      ),
    );
  }
}
