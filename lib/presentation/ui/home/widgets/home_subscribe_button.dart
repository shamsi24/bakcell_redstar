import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class HomeSubscribeButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const HomeSubscribeButton({
    super.key,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        onPressed: () {
          HapticFeedback.lightImpact();
          onPressed?.call();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: UIColor.bakcellRed,
          foregroundColor: UIColor.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Label(
          text: label,
          size: 15.sp,
          weight: FontWeight.w600,
          color: UIColor.white,
        ),
      ),
    );
  }
}
