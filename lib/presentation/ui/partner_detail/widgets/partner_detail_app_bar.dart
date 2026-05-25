import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/partner_detail/provider/partner_detail_provider.dart';
import 'package:redstar_module/presentation/ui/partner_detail/widgets/partner_detail_back_button.dart';

class PartnerDetailAppBar extends StatelessWidget {
  const PartnerDetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final title = context
        .select<PartnerDetailProvider, String>((p) => p.partner.name);
    return SizedBox(
      height: 56.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 4.w),
              child: const PartnerDetailBackButton(),
            ),
          ),
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
