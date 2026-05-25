import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/partners/provider/partners_provider.dart';
import 'package:redstar_module/presentation/ui/partners/widgets/partners_map_button.dart';

class PartnersSearchField extends StatelessWidget {
  const PartnersSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<PartnersProvider>().fields.searchController;
    return TextField(
      controller: controller,
      style: TextStyle(fontSize: 14.sp, color: UIColor.black),
      textInputAction: TextInputAction.search,
      cursorColor: UIColor.bakcellRed,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: UIColor.white,
        hintText: Lng.homeSearchHint,
        hintStyle: TextStyle(
          color: UIColor.darkGrey,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 14.h),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 14.w, right: 8.w),
          child: SvgPicture.asset(
            Img.search,
            colorFilter: ColorFilter.mode(UIColor.grey, BlendMode.srcIn),
            height: 20.sp,
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 36.w,
          minHeight: 36.h,
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.only(right: 6.w, top: 5.h, bottom: 5.h),
          child: const PartnersMapButton(),
        ),
        suffixIconConstraints: BoxConstraints(
          minWidth: 48.w,
          minHeight: 40.h,
        ),
        border: _border(),
        enabledBorder: _border(),
        focusedBorder: _border(color: UIColor.bakcellRed),
      ),
    );
  }

  OutlineInputBorder _border({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: color ?? UIColor.grey.withValues(alpha: 0.4),
      ),
      borderRadius: BorderRadius.circular(14.r),
    );
  }
}
