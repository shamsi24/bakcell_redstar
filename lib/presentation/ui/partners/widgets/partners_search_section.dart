import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/ui/partners/widgets/partners_map_button.dart';
import 'package:redstar_module/presentation/ui/partners/widgets/partners_search_field.dart';

class PartnersSearchSection extends StatelessWidget {
  const PartnersSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 0),
      child: Row(
        children: [
          const Expanded(child: PartnersSearchField()),
          10.horizontalSpace,
          const PartnersMapButton(),
        ],
      ),
    );
  }
}
