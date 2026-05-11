import 'package:flutter/material.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/home/widgets/bakcell_brand_label.dart';
import 'package:redstar_module/presentation/ui/home/widgets/profile_icon_button.dart';
import 'package:redstar_module/presentation/ui/home/widgets/upgrade_button.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const BakcellBrandLabel(),
        const Spacer(),
        const UpgradeButton(),
        8.horizontal,
        const ProfileIconButton(),
      ],
    );
  }
}
