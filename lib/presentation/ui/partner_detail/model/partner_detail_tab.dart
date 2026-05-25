import 'package:redstar_module/presentation/shared/shared.dart';

enum PartnerDetailTab { offers, branches, terms }

extension PartnerDetailTabX on PartnerDetailTab {
  String get label {
    switch (this) {
      case PartnerDetailTab.offers:
        return Lng.partnerTabOffers;
      case PartnerDetailTab.branches:
        return Lng.partnerTabBranches;
      case PartnerDetailTab.terms:
        return Lng.partnerTabTerms;
    }
  }
}
