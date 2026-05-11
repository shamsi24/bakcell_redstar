import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/home/provider/home_provider.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_campaign_card.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_section_title.dart';

class WeeklyCampaignsSection extends StatelessWidget {
  const WeeklyCampaignsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final campaigns = context.select<HomeProvider, List>(
      (provider) => provider.campaigns,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeSectionTitle(text: 'Weekly Campaigns'),
        12.vertical,
        SizedBox(
          height: 230.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: campaigns.length,
            separatorBuilder: (_, __) => 12.horizontal,
            itemBuilder: (_, index) => HomeCampaignCard(
              campaign: campaigns[index],
            ),
          ),
        ),
      ],
    );
  }
}
