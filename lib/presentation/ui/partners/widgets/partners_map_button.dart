import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class PartnersMapButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const PartnersMapButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: UIColor.bakcellRedTint,
      borderRadius: BorderRadius.circular(10.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.r),
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
            color: UIColor.darkGrey,
            size: 20.sp,
          ),
        ),
      ),
    );
  }
}
