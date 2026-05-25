import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/qr/model/qr_partner_info.dart';
import 'package:redstar_module/presentation/ui/qr/provider/qr_provider.dart';

class QrHeading extends StatelessWidget {
  const QrHeading({super.key});

  @override
  Widget build(BuildContext context) {
    final partner =
        context.select<QrProvider, QrPartnerInfo?>((p) => p.partner);
    if (partner == null) return const SizedBox.shrink();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Label(
            text: Lng.qrClaimDiscount(partner.discountPercent),
            size: 20.sp,
            weight: FontWeight.w700,
            color: UIColor.black,
          ),
          8.verticalSpace,
          Row(
            children: [
              Label(
                text: Lng.qrRemainingLimits,
                size: 14.sp,
                weight: FontWeight.w400,
                color: UIColor.black,
              ),
              4.horizontalSpace,
              Label(
                text: '${partner.remainingLimits}',
                size: 14.sp,
                weight: FontWeight.w700,
                color: UIColor.black,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
