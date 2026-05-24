import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/home/model/home_regular_campaign.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_pill_badge.dart';

class RegularCampaignCard extends StatelessWidget {
  final HomeRegularCampaign campaign;

  const RegularCampaignCard({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: UIColor.bakcellRedTint,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: CachedNetworkImage(
              imageUrl: campaign.brandLogoUrl,
              width: 56.r,
              height: 56.r,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(
                width: 56.r,
                height: 56.r,
                color: UIColor.white,
              ),
              errorWidget: (_, __, ___) => Container(
                width: 56.r,
                height: 56.r,
                color: UIColor.white,
              ),
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Label(
                  text: campaign.title,
                  size: 14.sp,
                  weight: FontWeight.w700,
                  color: UIColor.black,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                4.verticalSpace,
                Label(
                  text: campaign.brandName,
                  size: 12.sp,
                  weight: FontWeight.w400,
                  color: UIColor.darkGrey,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                8.verticalSpace,
                HomePillBadge(text: campaign.discountLabel),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
