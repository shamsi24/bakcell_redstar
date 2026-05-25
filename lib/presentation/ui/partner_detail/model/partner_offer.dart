enum PartnerOfferPeriod { weekly, regular }

class PartnerOffer {
  final String id;
  final String title;
  final String brandLabel;
  final String imageUrl;
  final String discountLabel;
  final PartnerOfferPeriod period;

  const PartnerOffer({
    required this.id,
    required this.title,
    required this.brandLabel,
    required this.imageUrl,
    required this.discountLabel,
    required this.period,
  });
}
