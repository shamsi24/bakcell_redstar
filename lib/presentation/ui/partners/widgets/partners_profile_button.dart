import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class PartnersProfileButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const PartnersProfileButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        HapticFeedback.lightImpact();
        onPressed?.call();
      },
      icon: Icon(
        Icons.person_outline,
        color: UIColor.black,
        size: 26.sp,
      ),
    );
  }
}
