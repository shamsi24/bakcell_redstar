import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/home/provider/home_provider.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_section_title.dart';
import 'package:redstar_module/presentation/ui/home/widgets/weekly_campaign_card.dart';

class WeeklyCampaignsSection extends StatelessWidget {
  const WeeklyCampaignsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final campaigns = context.select<HomeProvider, List>(
      (p) => p.weeklyCampaigns,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeSectionTitle(title: Lng.homeWeeklyCampaigns),
        12.verticalSpace,
        SizedBox(
          height: 170.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            physics: const BouncingScrollPhysics(),
            itemCount: campaigns.length,
            separatorBuilder: (_, __) => 12.horizontalSpace,
            itemBuilder: (_, index) =>
                WeeklyCampaignCard(campaign: campaigns[index]),
          ),
        ),
      ],
    );
  }
}
