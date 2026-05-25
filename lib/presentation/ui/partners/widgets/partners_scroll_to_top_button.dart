import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class PartnersScrollToTopButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PartnersScrollToTopButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: UIColor.bakcellRed,
      shape: const CircleBorder(),
      elevation: 4,
      shadowColor: UIColor.bakcellRed.withValues(alpha: 0.3),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () {
          HapticFeedback.lightImpact();
          onPressed();
        },
        child: SizedBox(
          width: 44.w,
          height: 44.w,
          child: Icon(
            Icons.arrow_upward_rounded,
            color: UIColor.white,
            size: 22.sp,
          ),
        ),
      ),
    );
  }
}
