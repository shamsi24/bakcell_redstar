import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/main/provider/main_provider.dart';
import 'package:redstar_module/presentation/ui/main/widgets/main_bottom_nav_item.dart';
import 'package:redstar_module/presentation/ui/main/widgets/main_bottom_nav_qr_item.dart';

class MainBottomNav extends StatelessWidget {
  const MainBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MainProvider>();
    final currentIndex = provider.currentIndex;
    final tabs = provider.tabs;
    final qrIndex = tabs.indexWhere((t) => t == MainTab.qr);

    return Container(
      decoration: BoxDecoration(
        color: UIColor.white,
        border: Border(
          top: BorderSide(color: UIColor.grey.withValues(alpha: 0.2)),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 76.h,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(tabs.length, (index) {
                    if (index == qrIndex) {
                      return SizedBox(width: 64.w);
                    }
                    final tab = tabs[index];
                    return MainBottomNavItem(
                      icon: tab.icon,
                      label: tab.label,
                      isActive: currentIndex == index,
                      onTap: () => provider.change(index),
                    );
                  }),
                ),
              ),
              Positioned(
                top: -20.h,
                left: 0,
                right: 0,
                child: Center(
                  child: MainBottomNavQrItem(
                    label: tabs[qrIndex].label,
                    isActive: currentIndex == qrIndex,
                    onTap: () => provider.change(qrIndex),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
