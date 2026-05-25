import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/ui/partner_detail/provider/partner_detail_provider.dart';
import 'package:redstar_module/presentation/ui/partner_detail/widgets/partner_branch_card.dart';

class PartnerBranchesSection extends StatelessWidget {
  const PartnerBranchesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final branches = context.watch<PartnerDetailProvider>().branches;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          for (int i = 0; i < branches.length; i++) ...[
            PartnerBranchCard(branch: branches[i]),
            if (i != branches.length - 1) 10.verticalSpace,
          ],
        ],
      ),
    );
  }
}
