import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/home/model/home_brand.dart';

class HomeBrandLogo extends StatelessWidget {
  final HomeBrand brand;

  const HomeBrandLogo({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    final size = 44.r;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: UIColor.white,
        border: Border.all(color: UIColor.white.withValues(alpha: 0.2)),
      ),
      clipBehavior: Clip.antiAlias,
      child: CachedNetworkImage(
        imageUrl: brand.logoUrl,
        fit: BoxFit.cover,
        placeholder: (_, __) => Container(color: UIColor.lightGray),
        errorWidget: (_, __, ___) => Container(color: UIColor.lightGray),
      ),
    );
  }
}
