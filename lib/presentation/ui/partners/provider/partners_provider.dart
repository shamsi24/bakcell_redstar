import 'package:flutter/material.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/partners/fields/partners_fields.dart';
import 'package:redstar_module/presentation/ui/partners/model/partner_category.dart';
import 'package:redstar_module/presentation/ui/partners/model/partner_item.dart';

class PartnersProvider extends ChangeNotifier {
  PartnersProvider() {
    fields = PartnersFields();
    fields.searchController.addListener(_onSearchChanged);
    fields.scrollController.addListener(_onScroll);
  }

  late final PartnersFields fields;

  String _searchQuery = '';
  String? _selectedCategoryId;
  bool _showScrollToTop = false;

  String get searchQuery => _searchQuery;
  String? get selectedCategoryId => _selectedCategoryId;
  bool get showScrollToTop => _showScrollToTop;

  List<PartnerCategory> get categories => [
        PartnerCategory(
          id: 'electronics_home',
          label: Lng.categoryElectronicsHome,
          icon: Icons.devices_other_outlined,
        ),
        PartnerCategory(
          id: 'food_beverages',
          label: Lng.categoryFoodBeverages,
          icon: Icons.fastfood_outlined,
        ),
        PartnerCategory(
          id: 'market',
          label: Lng.categoryMarket,
          icon: Icons.shopping_basket_outlined,
        ),
        PartnerCategory(
          id: 'pharmacy',
          label: Lng.categoryPharmacy,
          icon: Icons.medical_services_outlined,
        ),
        PartnerCategory(
          id: 'beauty',
          label: Lng.categoryBeauty,
          icon: Icons.brush_outlined,
        ),
        PartnerCategory(
          id: 'cinema',
          label: Lng.categoryCinema,
          icon: Icons.movie_outlined,
        ),
        PartnerCategory(
          id: 'restaurants',
          label: Lng.categoryRestaurants,
          icon: Icons.restaurant_outlined,
        ),
        PartnerCategory(
          id: 'shopping',
          label: Lng.categoryShopping,
          icon: Icons.shopping_bag_outlined,
        ),
        PartnerCategory(
          id: 'spare_parts',
          label: Lng.categorySpareParts,
          icon: Icons.build_outlined,
        ),
      ];

  final List<PartnerItem> _allPartners = const [
    PartnerItem(
      id: 'p1',
      name: 'Cinema Plus',
      logoUrl: 'https://picsum.photos/seed/cinemaplus/200',
      categoryId: 'cinema',
      discountLabel: '-15%',
    ),
    PartnerItem(
      id: 'p2',
      name: 'Pizza Hut',
      logoUrl: 'https://picsum.photos/seed/pizzahut-partner/200',
      categoryId: 'restaurants',
      discountLabel: '-15%',
    ),
    PartnerItem(
      id: 'p3',
      name: 'Pepsi',
      logoUrl: 'https://picsum.photos/seed/pepsi-partner/200',
      categoryId: 'food_beverages',
      discountLabel: '-15%',
    ),
    PartnerItem(
      id: 'p4',
      name: 'Trendyol',
      logoUrl: 'https://picsum.photos/seed/trendyol-partner/200',
      categoryId: 'shopping',
      discountLabel: '-15%',
    ),
    PartnerItem(
      id: 'p5',
      name: 'Papa Johns',
      logoUrl: 'https://picsum.photos/seed/papajohns-partner/200',
      categoryId: 'restaurants',
      discountLabel: '-15%',
    ),
    PartnerItem(
      id: 'p6',
      name: 'Michelin',
      logoUrl: 'https://picsum.photos/seed/michelin-partner/200',
      categoryId: 'spare_parts',
      discountLabel: '-15%',
    ),
    PartnerItem(
      id: 'p7',
      name: 'Chase',
      logoUrl: 'https://picsum.photos/seed/chase-partner/200',
      categoryId: 'restaurants',
      discountLabel: '-15%',
    ),
    PartnerItem(
      id: 'p8',
      name: 'Starbucks',
      logoUrl: 'https://picsum.photos/seed/starbucks-partner/200',
      categoryId: 'restaurants',
      discountLabel: '-15%',
    ),
    PartnerItem(
      id: 'p9',
      name: 'IKEA',
      logoUrl: 'https://picsum.photos/seed/ikea-partner-list/200',
      categoryId: 'electronics_home',
      discountLabel: '-15%',
    ),
    PartnerItem(
      id: 'p10',
      name: 'JYSK',
      logoUrl: 'https://picsum.photos/seed/jysk-partner-list/200',
      categoryId: 'electronics_home',
      discountLabel: '-15%',
    ),
    PartnerItem(
      id: 'p11',
      name: 'Aptek Plus',
      logoUrl: 'https://picsum.photos/seed/aptek-partner/200',
      categoryId: 'pharmacy',
      discountLabel: '-20%',
    ),
    PartnerItem(
      id: 'p12',
      name: 'Beauty Studio',
      logoUrl: 'https://picsum.photos/seed/beauty-partner/200',
      categoryId: 'beauty',
      discountLabel: '-10%',
    ),
  ];

  List<PartnerItem> get filteredPartners {
    final query = _searchQuery.trim().toLowerCase();
    return _allPartners.where((p) {
      final matchesCategory =
          _selectedCategoryId == null || p.categoryId == _selectedCategoryId;
      final matchesQuery =
          query.isEmpty || p.name.toLowerCase().contains(query);
      return matchesCategory && matchesQuery;
    }).toList();
  }

  String categoryLabelOf(String categoryId) {
    return categories
        .firstWhere(
          (c) => c.id == categoryId,
          orElse: () => categories.first,
        )
        .label;
  }

  void selectCategory(String categoryId) {
    _selectedCategoryId =
        _selectedCategoryId == categoryId ? null : categoryId;
    notifyListeners();
  }

  void scrollToTop() {
    if (!fields.scrollController.hasClients) return;
    fields.scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
    );
  }

  void _onSearchChanged() {
    final value = fields.searchController.text;
    if (value == _searchQuery) return;
    _searchQuery = value;
    notifyListeners();
  }

  void _onScroll() {
    final show = fields.scrollController.offset > 300;
    if (show != _showScrollToTop) {
      _showScrollToTop = show;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    fields.searchController.removeListener(_onSearchChanged);
    fields.scrollController.removeListener(_onScroll);
    fields.dispose();
    super.dispose();
  }
}
