import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/home/model/home_weekly_campaign.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_pill_badge.dart';

class WeeklyCampaignCard extends StatelessWidget {
  final HomeWeeklyCampaign campaign;

  const WeeklyCampaignCard({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height: 170.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: const Color(0xff2A0A10),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: campaign.imageUrl,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(color: UIColor.lightGray),
              errorWidget: (_, __, ___) => Container(color: UIColor.lightGray),
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withValues(alpha: 0.55),
                    Colors.black.withValues(alpha: 0.05),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 12.h,
            right: 12.w,
            child: HomePillBadge(
              text: campaign.periodLabel,
              isWeeklyTag: true,
            ),
          ),
          Positioned(
            left: 14.w,
            top: 14.h,
            right: 100.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Label(
                  text: campaign.title,
                  size: 16.sp,
                  weight: FontWeight.w700,
                  color: UIColor.white,
                  maxLines: 3,
                ),
                12.verticalSpace,
                HomePillBadge(
                  text: campaign.discountLabel,
                  fontSize: 11,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
