import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class HomeMapButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const HomeMapButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: UIColor.bakcellRedTint,
      borderRadius: BorderRadius.circular(6.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(6.r),
        onTap: () {
          HapticFeedback.lightImpact();
          onPressed?.call();
        },
        child: Container(
          width: 40.w,
          height: 36.h,
          alignment: Alignment.center,
          child: Icon(
            Icons.map_outlined,
            color: UIColor.grey,
            size: 20.sp,
          ),
        ),
      ),
    );
  }
}
