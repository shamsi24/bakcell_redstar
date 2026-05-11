import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/home/model/home_savings.dart';
import 'package:redstar_module/presentation/ui/home/provider/home_provider.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_section_title.dart';
import 'package:redstar_module/presentation/ui/home/widgets/savings_stat_item.dart';

class TotalSavingsSection extends StatelessWidget {
  const TotalSavingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final savings = context.select<HomeProvider, HomeSavings>(
      (provider) => provider.savings,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HomeSectionTitle(text: 'Total Savings'),
        12.vertical,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
            decoration: BoxDecoration(
              color: UIColor.bakcellRedTint,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: SavingsStatItem(
                      icon: Icons.payments_outlined,
                      label: 'Total Saved',
                      value: '${savings.totalSaved.toStringAsFixed(2)} ₼',
                    ),
                  ),
                  VerticalDivider(
                    color: UIColor.grey.withValues(alpha: 0.5),
                    thickness: 1,
                    width: 16.w,
                  ),
                  Expanded(
                    child: SavingsStatItem(
                      icon: Icons.confirmation_number_outlined,
                      label: 'Coupons',
                      value: '${savings.couponsCount}',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
