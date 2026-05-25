import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/ui/partner_detail/widgets/partner_detail_app_bar.dart';
import 'package:redstar_module/presentation/ui/partner_detail/widgets/partner_detail_tab_content.dart';
import 'package:redstar_module/presentation/ui/partner_detail/widgets/partner_detail_tabs.dart';
import 'package:redstar_module/presentation/ui/partner_detail/widgets/partner_offer_details_title.dart';
import 'package:redstar_module/presentation/ui/partner_detail/widgets/partner_summary_card.dart';

class PartnerDetailBody extends StatelessWidget {
  const PartnerDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 32.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const PartnerDetailAppBar(),
            12.verticalSpace,
            const PartnerSummaryCard(),
            20.verticalSpace,
            const PartnerOfferDetailsTitle(),
            const PartnerDetailTabs(),
            const PartnerDetailTabContent(),
          ],
        ),
      ),
    );
  }
}
