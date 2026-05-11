import 'package:flutter/foundation.dart';
import 'package:redstar_module/presentation/ui/home/fields/home_fields.dart';
import 'package:redstar_module/presentation/ui/home/model/home_banner.dart';
import 'package:redstar_module/presentation/ui/home/model/home_campaign.dart';
import 'package:redstar_module/presentation/ui/home/model/home_category.dart';
import 'package:redstar_module/presentation/ui/home/model/home_savings.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    fields = HomeFields();
    fields.searchController.addListener(_onSearchChanged);
  }

  late final HomeFields fields;

  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  final List<HomeBanner> banners = const [
    HomeBanner(
      id: 'b1',
      imageUrl: 'https://picsum.photos/seed/bakcell-banner-1/800/360',
    ),
    HomeBanner(
      id: 'b2',
      imageUrl: 'https://picsum.photos/seed/bakcell-banner-2/800/360',
    ),
    HomeBanner(
      id: 'b3',
      imageUrl: 'https://picsum.photos/seed/bakcell-banner-3/800/360',
    ),
    HomeBanner(
      id: 'b4',
      imageUrl: 'https://picsum.photos/seed/bakcell-banner-4/800/360',
    ),
  ];

  final List<HomeCategory> categories = const [
    HomeCategory(
      id: 'c1',
      title: 'Electronics and home',
      iconUrl: 'https://picsum.photos/seed/bakcell-cat-electronics/200',
    ),
    HomeCategory(
      id: 'c2',
      title: 'Food and beverages',
      iconUrl: 'https://picsum.photos/seed/bakcell-cat-food/200',
    ),
    HomeCategory(
      id: 'c3',
      title: 'Market / Supermarket',
      iconUrl: 'https://picsum.photos/seed/bakcell-cat-market/200',
    ),
    HomeCategory(
      id: 'c4',
      title: 'Spare parts',
      iconUrl: 'https://picsum.photos/seed/bakcell-cat-spare/200',
    ),
    HomeCategory(
      id: 'c5',
      title: 'Yanacaq doldurma',
      iconUrl: 'https://picsum.photos/seed/bakcell-cat-fuel/200',
    ),
    HomeCategory(
      id: 'c6',
      title: 'Pharmacy',
      iconUrl: 'https://picsum.photos/seed/bakcell-cat-pharmacy/200',
    ),
  ];

  final List<HomeCampaign> campaigns = const [
    HomeCampaign(
      id: 'cmp1',
      imageUrl: 'https://picsum.photos/seed/bakcell-campaign-1/900/420',
      title: 'Claim your 50% discount now',
      subtitle: 'Redeem your discount today!',
      badge: 'This week',
    ),
    HomeCampaign(
      id: 'cmp2',
      imageUrl: 'https://picsum.photos/seed/bakcell-campaign-2/900/420',
      title: 'Free delivery on weekends',
      subtitle: 'Available in selected stores',
      badge: 'New',
    ),
    HomeCampaign(
      id: 'cmp3',
      imageUrl: 'https://picsum.photos/seed/bakcell-campaign-3/900/420',
      title: 'Earn double cashback',
      subtitle: 'On all electronics purchases',
      badge: 'Hot',
    ),
  ];

  final HomeSavings savings = const HomeSavings(
    totalSaved: 124.80,
    couponsCount: 18,
  );

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
