import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/ui/qr/widgets/qr_app_bar.dart';
import 'package:redstar_module/presentation/ui/qr/widgets/qr_bottom_section.dart';
import 'package:redstar_module/presentation/ui/qr/widgets/qr_code_card.dart';
import 'package:redstar_module/presentation/ui/qr/widgets/qr_heading.dart';

class QrBody extends StatelessWidget {
  const QrBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const QrAppBar(),
          16.verticalSpace,
          const QrHeading(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: const QrCodeCard(),
            ),
          ),
          const QrBottomSection(),
        ],
      ),
    );
  }
}
