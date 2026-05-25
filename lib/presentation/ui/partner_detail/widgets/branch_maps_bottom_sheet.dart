import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/router/navigation.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/partner_detail/model/partner_branch.dart';
import 'package:redstar_module/presentation/ui/partner_detail/widgets/branch_maps_option.dart';

class BranchMapsBottomSheet {
  BranchMapsBottomSheet._();

  static Future<void> show(
    BuildContext context, {
    required PartnerBranch branch,
  }) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: UIColor.white,
      barrierColor: UIColor.black.withValues(alpha: 0.3),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(26.r)),
      ),
      isScrollControlled: true,
      builder: (_) => _BranchMapsContent(branch: branch),
    );
  }
}

class _BranchMapsContent extends StatelessWidget {
  final PartnerBranch branch;

  const _BranchMapsContent({required this.branch});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          8.verticalSpace,
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(
                CupertinoIcons.xmark,
                size: 22.sp,
                color: UIColor.black,
              ),
              onPressed: () => Navigation.pop(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 8.h),
            child: Label(
              text: Lng.partnerOpenIn,
              size: 18.sp,
              weight: FontWeight.w700,
              color: UIColor.black,
            ),
          ),
          BranchMapsOption(
            icon: Icons.map_rounded,
            iconBackgroundColor: const Color(0xff34A853),
            iconColor: UIColor.white,
            label: 'Google Maps',
            onTap: () => Navigation.pop(),
          ),
          BranchMapsOption(
            icon: Icons.public_rounded,
            iconBackgroundColor: const Color(0xff007AFF),
            iconColor: UIColor.white,
            label: 'Apple Maps',
            onTap: () => Navigation.pop(),
          ),
          BranchMapsOption(
            icon: Icons.navigation_rounded,
            iconBackgroundColor: const Color(0xff33CCFF),
            iconColor: UIColor.white,
            label: 'Waze',
            onTap: () => Navigation.pop(),
          ),
          16.verticalSpace,
        ],
      ),
    );
  }
}
