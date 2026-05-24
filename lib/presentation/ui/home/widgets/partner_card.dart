import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/home/model/home_partner.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_pill_badge.dart';

class PartnerCard extends StatelessWidget {
  final HomePartner partner;

  const PartnerCard({super.key, required this.partner});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14.r),
                child: CachedNetworkImage(
                  imageUrl: partner.logoUrl,
                  width: 100.w,
                  height: 100.w,
                  fit: BoxFit.cover,
                  placeholder: (_, __) => Container(
                    width: 100.w,
                    height: 100.w,
                    color: UIColor.lightGray,
                  ),
                  errorWidget: (_, __, ___) => Container(
                    width: 100.w,
                    height: 100.w,
                    color: UIColor.lightGray,
                  ),
                ),
              ),
              Positioned(
                top: 8.h,
                left: 8.w,
                child: HomePillBadge(text: partner.discountLabel),
              ),
            ],
          ),
          8.verticalSpace,
          Label(
            text: partner.name,
            size: 13.sp,
            weight: FontWeight.w500,
            color: UIColor.black,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
