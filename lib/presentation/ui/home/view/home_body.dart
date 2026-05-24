import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_header.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_hero_section.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_search_section.dart';
import 'package:redstar_module/presentation/ui/home/widgets/partners_section.dart';
import 'package:redstar_module/presentation/ui/home/widgets/regular_campaigns_section.dart';
import 'package:redstar_module/presentation/ui/home/widgets/weekly_campaigns_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeHeader(),
            const HomeHeroSection(),
            const HomeSearchSection(),
            24.verticalSpace,
            const WeeklyCampaignsSection(),
            24.verticalSpace,
            const RegularCampaignsSection(),
            24.verticalSpace,
            const PartnersSection(),
          ],
        ),
      ),
    );
  }
}
