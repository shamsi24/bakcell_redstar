import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/home/model/home_partner.dart';
import 'package:redstar_module/presentation/ui/home/provider/home_provider.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_section_title.dart';
import 'package:redstar_module/presentation/ui/home/widgets/partner_card.dart';

class PartnersSection extends StatelessWidget {
  const PartnersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final partners = context.select<HomeProvider, List<HomePartner>>(
      (p) => p.partners,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeSectionTitle(
          title: Lng.homePartners,
          showSeeAll: true,
          onSeeAll: () {},
        ),
        12.verticalSpace,
        SizedBox(
          height: 140.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: partners.length,
            separatorBuilder: (_, __) => 12.horizontalSpace,
            itemBuilder: (_, index) => PartnerCard(partner: partners[index]),
          ),
        ),
      ],
    );
  }
}
