import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/router/navigation.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class PartnerDetailBackButton extends StatelessWidget {
  const PartnerDetailBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        HapticFeedback.lightImpact();
        Navigation.pop();
      },
      icon: Icon(
        CupertinoIcons.back,
        color: UIColor.black,
        size: 26.sp,
      ),
    );
  }
}
