import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/qr/provider/qr_provider.dart';
import 'package:redstar_module/presentation/ui/qr/widgets/qr_back_button.dart';

class QrAppBar extends StatelessWidget {
  const QrAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final title =
        context.select<QrProvider, String?>((p) => p.partner?.name);
    return SizedBox(
      height: 56.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 4.w),
              child: const QrBackButton(),
            ),
          ),
          if (title != null)
            Label(
              text: title,
              size: 18.sp,
              weight: FontWeight.w700,
              color: UIColor.black,
            ),
        ],
      ),
    );
  }
}
