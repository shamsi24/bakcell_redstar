import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/ui/partner_detail/model/partner_detail_tab.dart';
import 'package:redstar_module/presentation/ui/partner_detail/provider/partner_detail_provider.dart';
import 'package:redstar_module/presentation/ui/partner_detail/widgets/partner_detail_tab_button.dart';

class PartnerDetailTabs extends StatelessWidget {
  const PartnerDetailTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PartnerDetailProvider>();
    final current = provider.currentTab;
    return Padding(
      padding: EdgeInsets.fromLTRB(12.w, 0, 16.w, 16.h),
      child: Row(
        children: [
          for (final tab in PartnerDetailTab.values) ...[
            PartnerDetailTabButton(
              label: tab.label,
              isSelected: current == tab,
              onTap: () => provider.selectTab(tab),
            ),
            4.horizontalSpace,
          ],
        ],
      ),
    );
  }
}
