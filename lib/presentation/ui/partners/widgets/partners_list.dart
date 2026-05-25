import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/ui/partners/model/partner_item.dart';
import 'package:redstar_module/presentation/ui/partners/provider/partners_provider.dart';
import 'package:redstar_module/presentation/ui/partners/widgets/partner_list_item.dart';

class PartnersList extends StatelessWidget {
  const PartnersList({super.key});

  @override
  Widget build(BuildContext context) {
    final partners = context.select<PartnersProvider, List<PartnerItem>>(
      (p) => p.filteredPartners,
    );
    if (partners.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          for (int i = 0; i < partners.length; i++) ...[
            PartnerListItem(partner: partners[i]),
            if (i != partners.length - 1) 10.verticalSpace,
          ],
        ],
      ),
    );
  }
}
