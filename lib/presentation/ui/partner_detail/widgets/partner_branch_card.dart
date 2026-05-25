import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/partner_detail/model/partner_branch.dart';
import 'package:redstar_module/presentation/ui/partner_detail/widgets/branch_maps_bottom_sheet.dart';
import 'package:redstar_module/presentation/ui/partner_detail/widgets/partner_branch_open_button.dart';

class PartnerBranchCard extends StatelessWidget {
  final PartnerBranch branch;

  const PartnerBranchCard({super.key, required this.branch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: UIColor.lightGray,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 36.r,
            height: 36.r,
            decoration: BoxDecoration(
              color: UIColor.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            alignment: Alignment.center,
            child: Icon(
              Icons.location_on_outlined,
              color: UIColor.black,
              size: 20.sp,
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Label(
                  text: branch.name,
                  size: 13.sp,
                  weight: FontWeight.w600,
                  color: UIColor.black,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                4.verticalSpace,
                Label(
                  text: branch.address,
                  size: 11.sp,
                  weight: FontWeight.w400,
                  color: UIColor.darkGrey,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          8.horizontalSpace,
          PartnerBranchOpenButton(
            onPressed: () =>
                BranchMapsBottomSheet.show(context, branch: branch),
          ),
        ],
      ),
    );
  }
}
