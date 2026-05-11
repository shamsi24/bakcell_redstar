import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/home/model/home_banner.dart';

class HomeBannerCard extends StatelessWidget {
  final HomeBanner banner;
  final bool isHighlighted;

  const HomeBannerCard({
    super.key,
    required this.banner,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: isHighlighted ? UIColor.bakcellRed : UIColor.clear,
          width: 1.5,
        ),
      ),
      padding: EdgeInsets.all(isHighlighted ? 3.w : 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: CachedNetworkImage(
          imageUrl: banner.imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 90.h,
          placeholder: (_, __) => Container(color: UIColor.lightGray),
          errorWidget: (_, __, ___) => Container(color: UIColor.lightGray),
        ),
      ),
    );
  }
}
