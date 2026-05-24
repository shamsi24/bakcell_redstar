import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/ui/home/model/home_hero.dart';
import 'package:redstar_module/presentation/ui/home/provider/home_provider.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_hero_card.dart';

class HomeHeroSection extends StatelessWidget {
  const HomeHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final hero = context.select<HomeProvider, HomeHero>((p) => p.hero);
    return Padding(
      padding: EdgeInsets.only(top: 4.h, bottom: 16.h),
      child: HomeHeroCard(hero: hero),
    );
  }
}
