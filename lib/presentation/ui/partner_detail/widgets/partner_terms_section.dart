import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/partner_detail/provider/partner_detail_provider.dart';

class PartnerTermsSection extends StatelessWidget {
  const PartnerTermsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PartnerDetailProvider>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Label(
            text: provider.termsIntro,
            size: 14.sp,
            weight: FontWeight.w400,
            color: UIColor.black,
            maxLines: 20,
          ),
          16.verticalSpace,
          Label(
            text: Lng.partnerTermsTitle,
            size: 14.sp,
            weight: FontWeight.w700,
            color: UIColor.black,
          ),
          8.verticalSpace,
          for (final bullet in provider.termsBullets)
            Padding(
              padding: EdgeInsets.only(bottom: 6.h, left: 4.w),
              child: _BulletItem(text: bullet),
            ),
        ],
      ),
    );
  }
}

class _BulletItem extends StatelessWidget {
  final String text;

  const _BulletItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 8.h, right: 8.w),
          child: Container(
            width: 4.w,
            height: 4.w,
            decoration: const BoxDecoration(
              color: UIColor.black,
              shape: BoxShape.circle,
            ),
          ),
        ),
        Expanded(
          child: Label(
            text: text,
            size: 14.sp,
            weight: FontWeight.w400,
            color: UIColor.black,
            maxLines: 6,
          ),
        ),
      ],
    );
  }
}
