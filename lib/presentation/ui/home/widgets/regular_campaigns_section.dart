import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/home/model/home_regular_campaign.dart';
import 'package:redstar_module/presentation/ui/home/provider/home_provider.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_section_title.dart';
import 'package:redstar_module/presentation/ui/home/widgets/regular_campaign_card.dart';

class RegularCampaignsSection extends StatelessWidget {
  const RegularCampaignsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final campaigns = context.select<HomeProvider, List<HomeRegularCampaign>>(
      (p) => p.regularCampaigns,
    );
    final columnCount = (campaigns.length / 2).ceil();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeSectionTitle(
          title: Lng.homeRegularCampaigns,
          showSeeAll: true,
          onSeeAll: () {},
        ),
        12.verticalSpace,
        SizedBox(
          height: 200.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: columnCount,
            separatorBuilder: (_, __) => 12.horizontalSpace,
            itemBuilder: (_, columnIndex) {
              final firstIndex = columnIndex * 2;
              final secondIndex = firstIndex + 1;
              return SizedBox(
                width: 300.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RegularCampaignCard(campaign: campaigns[firstIndex]),
                    if (secondIndex < campaigns.length) ...[
                      10.verticalSpace,
                      RegularCampaignCard(campaign: campaigns[secondIndex]),
                    ],
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
