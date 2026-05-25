import 'package:flutter/foundation.dart';
import 'package:redstar_module/presentation/ui/partner_detail/model/partner_branch.dart';
import 'package:redstar_module/presentation/ui/partner_detail/model/partner_detail_tab.dart';
import 'package:redstar_module/presentation/ui/partner_detail/model/partner_offer.dart';
import 'package:redstar_module/presentation/ui/partner_detail/model/partner_summary.dart';

class PartnerDetailProvider extends ChangeNotifier {
  PartnerDetailProvider({required this.partner});

  final PartnerSummary partner;

  PartnerDetailTab _currentTab = PartnerDetailTab.offers;
  final Set<String> _redeemedOfferIds = {};

  PartnerDetailTab get currentTab => _currentTab;

  bool isOfferRedeemed(String offerId) => _redeemedOfferIds.contains(offerId);

  final List<PartnerOffer> offers = const [
    PartnerOffer(
      id: 'o1',
      title: 'Premium style,\nexclusive savings',
      brandLabel: 'dyson x bakcell',
      imageUrl: 'https://picsum.photos/seed/dyson-offer/800/400',
      discountLabel: '10% discount',
      period: PartnerOfferPeriod.weekly,
    ),
    PartnerOffer(
      id: 'o2',
      title: 'Ultra-fast home Wi-Fi',
      brandLabel: 'Bakcell',
      imageUrl: 'https://picsum.photos/seed/bakcell-wifi/800/400',
      discountLabel: '25% discount',
      period: PartnerOfferPeriod.regular,
    ),
  ];

  final List<PartnerBranch> branches = const [
    PartnerBranch(
      id: 'b1',
      name: 'Cinema Plus Neriman Nerimanov Filialı - Metro Park',
      address: 'Sahil. Ü.Hacıbəyli küç.48',
      latitude: 40.4093,
      longitude: 49.8671,
    ),
    PartnerBranch(
      id: 'b2',
      name: 'Cinema Plus Genclik',
      address: 'Baku City Ashig Mahammadguli Juma Street 15, 45',
      latitude: 40.4047,
      longitude: 49.8721,
    ),
    PartnerBranch(
      id: 'b3',
      name: 'Papa Johns Deniz Mall',
      address: 'Sahil. Ü.Hacıbəyli küç.48',
      latitude: 40.3679,
      longitude: 49.8350,
    ),
    PartnerBranch(
      id: 'b4',
      name: 'Papa Johns Ahmadli',
      address: 'Sahil. Ü.Hacıbəyli küç.48',
      latitude: 40.3835,
      longitude: 49.9512,
    ),
  ];

  final String termsIntro =
      'It\'s the perfect time to watch the newest movies on the big screen! As a "Red Star" subscriber, you get a 15% discount on all tickets at Cinema Plus theaters.';

  final List<String> termsBullets = const [
    'Valid until December 31, 2026.',
    'The discount applies only to weekday (Monday - Friday) screenings.',
    'Each subscriber can use this offer only once per day.',
    'The discount is not valid for VIP halls, Platinum tickets, and 3D glasses.',
    'Present the QR code/promo code generated in the app at the checkout before payment.',
  ];

  void selectTab(PartnerDetailTab tab) {
    if (_currentTab == tab) return;
    _currentTab = tab;
    notifyListeners();
  }

  void redeemOffer(String offerId) {
    if (_redeemedOfferIds.contains(offerId)) return;
    _redeemedOfferIds.add(offerId);
    notifyListeners();
  }
}
