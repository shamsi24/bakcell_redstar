import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_banners.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_categories.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_header.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_search_bar.dart';
import 'package:redstar_module/presentation/ui/home/widgets/total_savings_section.dart';
import 'package:redstar_module/presentation/ui/home/widgets/weekly_campaigns_section.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
              child: const HomeHeader(),
            ),
            16.vertical,
            const HomeBanners(),
            16.vertical,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const HomeSearchBar(),
            ),
            16.vertical,
            const HomeCategories(),
            24.vertical,
            const WeeklyCampaignsSection(),
            24.vertical,
            const TotalSavingsSection(),
            24.vertical,
          ],
        ),
      ),
    );
  }
}
