import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/ui/partner_detail/model/partner_offer.dart';
import 'package:redstar_module/presentation/ui/partner_detail/provider/partner_detail_provider.dart';
import 'package:redstar_module/presentation/ui/partner_detail/widgets/partner_offer_card.dart';

class PartnerOffersSection extends StatelessWidget {
  const PartnerOffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PartnerDetailProvider>();
    final offers = provider.offers;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          for (int i = 0; i < offers.length; i++) ...[
            _OfferTile(offer: offers[i]),
            if (i != offers.length - 1) 12.verticalSpace,
          ],
        ],
      ),
    );
  }
}

class _OfferTile extends StatelessWidget {
  final PartnerOffer offer;

  const _OfferTile({required this.offer});

  @override
  Widget build(BuildContext context) {
    final isRedeemed = context.select<PartnerDetailProvider, bool>(
      (p) => p.isOfferRedeemed(offer.id),
    );
    return PartnerOfferCard(offer: offer, isRedeemed: isRedeemed);
  }
}
