import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/ui/partners/provider/partners_provider.dart';
import 'package:redstar_module/presentation/ui/partners/widgets/partners_categories_section.dart';
import 'package:redstar_module/presentation/ui/partners/widgets/partners_header.dart';
import 'package:redstar_module/presentation/ui/partners/widgets/partners_list.dart';
import 'package:redstar_module/presentation/ui/partners/widgets/partners_search_section.dart';
import 'package:redstar_module/presentation/ui/partners/widgets/partners_section_title.dart';

class PartnersScrollView extends StatelessWidget {
  const PartnersScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =
        context.read<PartnersProvider>().fields.scrollController;
    return SingleChildScrollView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(bottom: 80.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PartnersHeader(),
          const PartnersSearchSection(),
          16.verticalSpace,
          const PartnersCategoriesSection(),
          const PartnersSectionTitle(),
          const PartnersList(),
        ],
      ),
    );
  }
}
