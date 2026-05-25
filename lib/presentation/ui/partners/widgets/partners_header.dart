import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/ui/partners/widgets/partners_close_button.dart';
import 'package:redstar_module/presentation/ui/partners/widgets/partners_logo.dart';
import 'package:redstar_module/presentation/ui/partners/widgets/partners_profile_button.dart';

class PartnersHeader extends StatelessWidget {
  const PartnersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 4.h, 8.w, 4.h),
      child: const Row(
        children: [
          Expanded(child: PartnersLogo()),
          PartnersProfileButton(),
          PartnersCloseButton(),
        ],
      ),
    );
  }
}
