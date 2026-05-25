import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/partner_detail/model/partner_summary.dart';
import 'package:redstar_module/presentation/ui/partner_detail/provider/partner_detail_provider.dart';

class PartnerSummaryCard extends StatelessWidget {
  const PartnerSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final partner = context
        .select<PartnerDetailProvider, PartnerSummary>((p) => p.partner);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: CachedNetworkImage(
              imageUrl: partner.logoUrl,
              width: 48.r,
              height: 48.r,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(
                width: 48.r,
                height: 48.r,
                color: UIColor.lightGray,
              ),
              errorWidget: (_, __, ___) => Container(
                width: 48.r,
                height: 48.r,
                color: UIColor.lightGray,
              ),
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Label(
                  text: partner.name,
                  size: 16.sp,
                  weight: FontWeight.w700,
                  color: UIColor.black,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                4.verticalSpace,
                Label(
                  text: partner.category,
                  size: 12.sp,
                  weight: FontWeight.w400,
                  color: UIColor.darkGrey,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          8.horizontalSpace,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: UIColor.bakcellRedTint,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Label(
              text: partner.discountLabel,
              size: 12.sp,
              weight: FontWeight.w700,
              color: UIColor.bakcellRed,
            ),
          ),
        ],
      ),
    );
  }
}
