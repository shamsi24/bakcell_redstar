import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_close_button.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_logo.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_profile_button.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 4.h, 8.w, 4.h),
      child: Row(
        children: [
          const Expanded(child: HomeLogo()),
          const HomeProfileButton(),
          const HomeCloseButton(),
        ],
      ),
    );
  }
}
