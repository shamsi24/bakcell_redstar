import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/home/model/home_hero.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_brand_strip.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_hero_title.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_subscribe_button.dart';

class HomeHeroCard extends StatelessWidget {
  final HomeHero hero;

  const HomeHeroCard({super.key, required this.hero});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: const RadialGradient(
            center: Alignment.topCenter,
            radius: 1.2,
            colors: [
              Color(0xff3A1218),
              Color(0xff140608),
            ],
          ),
        ),
        padding: EdgeInsets.fromLTRB(0, 16.h, 0, 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeBrandStrip(brands: hero.brands),
            16.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeHeroTitle(amount: hero.weeklySavingAmount),
                  10.verticalSpace,
                  Label(
                    align: TextAlign.center,
                    text: hero.subtitle,
                    size: 12.sp,
                    weight: FontWeight.w400,
                    color: UIColor.white.withValues(alpha: 0.6),
                    maxLines: 3,
                  ),
                  16.verticalSpace,
                  HomeSubscribeButton(label: hero.ctaText),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
