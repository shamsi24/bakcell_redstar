import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/home/provider/home_provider.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<HomeProvider>().fields.searchController;
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
          color: UIColor.grey,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 14.h),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 14.w, right: 8.w),
          child: Icon(
            Icons.search,
            color: UIColor.grey,
            size: 20.sp,
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 36.w,
          minHeight: 36.h,
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
        color: color ?? UIColor.grey.withValues(alpha: 0.25),
      ),
      borderRadius: BorderRadius.circular(14.r),
    );
  }
}
