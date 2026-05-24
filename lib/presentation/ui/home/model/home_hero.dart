import 'package:redstar_module/presentation/ui/home/model/home_brand.dart';

class HomeHero {
  final double weeklySavingAmount;
  final String subtitle;
  final String ctaText;
  final List<HomeBrand> brands;

  const HomeHero({
    required this.weeklySavingAmount,
    required this.subtitle,
    required this.ctaText,
    required this.brands,
  });
}
