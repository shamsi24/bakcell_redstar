import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/ui/partner_detail/model/partner_detail_tab.dart';
import 'package:redstar_module/presentation/ui/partner_detail/provider/partner_detail_provider.dart';
import 'package:redstar_module/presentation/ui/partner_detail/widgets/partner_branches_section.dart';
import 'package:redstar_module/presentation/ui/partner_detail/widgets/partner_offers_section.dart';
import 'package:redstar_module/presentation/ui/partner_detail/widgets/partner_terms_section.dart';

class PartnerDetailTabContent extends StatelessWidget {
  const PartnerDetailTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final tab = context.select<PartnerDetailProvider, PartnerDetailTab>(
      (p) => p.currentTab,
    );
    switch (tab) {
      case PartnerDetailTab.offers:
        return const PartnerOffersSection();
      case PartnerDetailTab.branches:
        return const PartnerBranchesSection();
      case PartnerDetailTab.terms:
        return const PartnerTermsSection();
    }
  }
}
