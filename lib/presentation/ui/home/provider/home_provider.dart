import 'package:flutter/foundation.dart';
import 'package:redstar_module/presentation/ui/home/fields/home_fields.dart';
import 'package:redstar_module/presentation/ui/home/model/home_brand.dart';
import 'package:redstar_module/presentation/ui/home/model/home_hero.dart';
import 'package:redstar_module/presentation/ui/home/model/home_partner.dart';
import 'package:redstar_module/presentation/ui/home/model/home_regular_campaign.dart';
import 'package:redstar_module/presentation/ui/home/model/home_weekly_campaign.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    fields = HomeFields();
    fields.searchController.addListener(_onSearchChanged);
  }

  late final HomeFields fields;

  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  final HomeHero hero = const HomeHero(
    weeklySavingAmount: 40,
    subtitle:
        "Get 70% off at Papa John's this Wednesday, plus 5 daily discounts every single day.",
    ctaText: "Subscribe for 0₼",
    brands: [
      HomeBrand(
        id: 'starbucks',
        name: 'Starbucks',
        logoUrl: 'https://picsum.photos/seed/starbucks-logo/120',
      ),
      HomeBrand(
        id: 'trendyol',
        name: 'Trendyol',
        logoUrl: 'https://picsum.photos/seed/trendyol-logo/120',
      ),
      HomeBrand(
        id: 'ikea',
        name: 'IKEA',
        logoUrl: 'https://picsum.photos/seed/ikea-logo/120',
      ),
      HomeBrand(
        id: 'burger-king',
        name: 'Burger King',
        logoUrl: 'https://picsum.photos/seed/burgerking-logo/120',
      ),
      HomeBrand(
        id: 'pizza-hut',
        name: 'Pizza Hut',
        logoUrl: 'https://picsum.photos/seed/pizzahut-logo/120',
      ),
      HomeBrand(
        id: 'michelin',
        name: 'Michelin',
        logoUrl: 'https://picsum.photos/seed/michelin-logo/120',
      ),
      HomeBrand(
        id: 'carrefour',
        name: 'Carrefour',
        logoUrl: 'https://picsum.photos/seed/carrefour-logo/120',
      ),
    ],
  );

  final List<HomeWeeklyCampaign> weeklyCampaigns = const [
    HomeWeeklyCampaign(
      id: 'w1',
      title: 'Premium style,\nexclusive savings',
      imageUrl: 'https://picsum.photos/seed/dyson-bakcell/800/400',
      discountLabel: '10% discount',
      periodLabel: 'This week',
    ),
    HomeWeeklyCampaign(
      id: 'w2',
      title: 'Coffee moments,\nmaximum value',
      imageUrl: 'https://picsum.photos/seed/starbucks-weekly/800/400',
      discountLabel: '15% discount',
      periodLabel: 'This week',
    ),
    HomeWeeklyCampaign(
      id: 'w3',
      title: 'Comfort meets\nsmart pricing',
      imageUrl: 'https://picsum.photos/seed/ikea-weekly/800/400',
      discountLabel: '20% discount',
      periodLabel: 'This week',
    ),
  ];

  final List<HomeRegularCampaign> regularCampaigns = const [
    HomeRegularCampaign(
      id: 'r1',
      title: 'Share the coffee love',
      brandName: 'Starbucks',
      brandLogoUrl: 'https://picsum.photos/seed/starbucks-card/120',
      discountLabel: '1+1 FREE',
    ),
    HomeRegularCampaign(
      id: 'r2',
      title: 'Share the coffee love',
      brandName: 'barcaffe',
      brandLogoUrl: 'https://picsum.photos/seed/barcaffe-card/120',
      discountLabel: '-25%',
    ),
    HomeRegularCampaign(
      id: 'r3',
      title: 'Fresh deals every day',
      brandName: 'Carrefour',
      brandLogoUrl: 'https://picsum.photos/seed/carrefour-card/120',
      discountLabel: '-10%',
    ),
    HomeRegularCampaign(
      id: 'r4',
      title: 'Tech that thrills',
      brandName: 'MediaMarkt',
      brandLogoUrl: 'https://picsum.photos/seed/mediamarkt-card/120',
      discountLabel: '-30%',
    ),
  ];

  final List<HomePartner> partners = const [
    HomePartner(
      id: 'p1',
      name: 'JYSK',
      logoUrl: 'https://picsum.photos/seed/jysk-partner/240',
      discountLabel: '-15%',
    ),
    HomePartner(
      id: 'p2',
      name: 'IKEA',
      logoUrl: 'https://picsum.photos/seed/ikea-partner/240',
      discountLabel: '-15%',
    ),
    HomePartner(
      id: 'p3',
      name: 'Burger King',
      logoUrl: 'https://picsum.photos/seed/bk-partner/240',
      discountLabel: '-15%',
    ),
    HomePartner(
      id: 'p4',
      name: 'Pizza Hut',
      logoUrl: 'https://picsum.photos/seed/ph-partner/240',
      discountLabel: '-20%',
    ),
    HomePartner(
      id: 'p5',
      name: 'Starbucks',
      logoUrl: 'https://picsum.photos/seed/sb-partner/240',
      discountLabel: '-10%',
    ),
  ];

  void _onSearchChanged() {
    final value = fields.searchController.text;
    if (value == _searchQuery) return;
    _searchQuery = value;
    notifyListeners();
  }

  @override
  void dispose() {
    fields.searchController.removeListener(_onSearchChanged);
    fields.dispose();
    super.dispose();
  }
}
