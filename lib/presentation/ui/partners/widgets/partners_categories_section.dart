import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/ui/partners/provider/partners_provider.dart';
import 'package:redstar_module/presentation/ui/partners/widgets/partner_category_chip.dart';

class PartnersCategoriesSection extends StatelessWidget {
  const PartnersCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PartnersProvider>();
    final categories = provider.categories;
    final selectedId = provider.selectedCategoryId;
    return SizedBox(
      height: 48.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        separatorBuilder: (_, __) => 8.horizontalSpace,
        itemBuilder: (_, index) {
          final cat = categories[index];
          return PartnerCategoryChip(
            category: cat,
            isSelected: cat.id == selectedId,
            onTap: () => provider.selectCategory(cat.id),
          );
        },
      ),
    );
  }
}
