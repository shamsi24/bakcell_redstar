import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/home/provider/home_provider.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_banner_card.dart';

class HomeBanners extends StatelessWidget {
  const HomeBanners({super.key});

  @override
  Widget build(BuildContext context) {
    final banners = context.select<HomeProvider, List>(
      (provider) => provider.banners,
    );

    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: banners.length,
        separatorBuilder: (_, __) => 10.horizontal,
        itemBuilder: (_, index) => HomeBannerCard(
          banner: banners[index],
          isHighlighted: index == 0,
        ),
      ),
    );
  }
}
