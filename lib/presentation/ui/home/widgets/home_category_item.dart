import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/home/model/home_category.dart';

class HomeCategoryItem extends StatelessWidget {
  final HomeCategory category;
  final VoidCallback? onPressed;

  const HomeCategoryItem({
    super.key,
    required this.category,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(12.r),
            onTap: () {
              HapticFeedback.lightImpact();
              onPressed?.call();
            },
            child: Container(
              width: 72.w,
              height: 72.h,
              decoration: BoxDecoration(
                color: UIColor.bakcellRedTint,
                borderRadius: BorderRadius.circular(12.r),
              ),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: CachedNetworkImage(
                  imageUrl: category.iconUrl,
                  fit: BoxFit.cover,
                  width: 40.w,
                  height: 40.h,
                  placeholder: (_, __) => Container(color: UIColor.lightGray),
                  errorWidget: (_, __, ___) => Icon(
                    Icons.image_outlined,
                    color: UIColor.bakcellRed,
                    size: 24.sp,
                  ),
                ),
              ),
            ),
          ),
          6.vertical,
          Label(
            text: category.title,
            size: 11.sp,
            color: UIColor.black,
            weight: FontWeight.w500,
            align: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
