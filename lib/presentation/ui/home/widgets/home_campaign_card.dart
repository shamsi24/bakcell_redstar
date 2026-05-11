import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/home/model/home_campaign.dart';

class HomeCampaignCard extends StatelessWidget {
  final HomeCampaign campaign;

  const HomeCampaignCard({super.key, required this.campaign});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      decoration: BoxDecoration(
        color: UIColor.bakcellRedTint,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14.r),
              topRight: Radius.circular(14.r),
            ),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: campaign.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150.h,
                  placeholder: (_, __) => Container(
                    height: 150.h,
                    color: UIColor.lightGray,
                  ),
                  errorWidget: (_, __, ___) => Container(
                    height: 150.h,
                    color: UIColor.lightGray,
                  ),
                ),
                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: UIColor.bakcellRed,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Label(
                      text: campaign.badge,
                      color: UIColor.white,
                      size: 11.sp,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(14.w, 12.h, 14.w, 14.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Label(
                  text: campaign.title,
                  size: 15.sp,
                  weight: FontWeight.w700,
                  color: UIColor.black,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                4.vertical,
                Label(
                  text: campaign.subtitle,
                  size: 12.sp,
                  color: UIColor.darkGrey,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
