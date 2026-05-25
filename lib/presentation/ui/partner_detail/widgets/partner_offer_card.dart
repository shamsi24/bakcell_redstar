import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/partner_detail/model/partner_offer.dart';
import 'package:redstar_module/presentation/ui/partner_detail/widgets/dashed_line.dart';
import 'package:redstar_module/presentation/ui/partner_detail/widgets/partner_offer_discount_badge.dart';
import 'package:redstar_module/presentation/ui/partner_detail/widgets/partner_offer_expired_label.dart';
import 'package:redstar_module/presentation/ui/partner_detail/widgets/partner_offer_period_badge.dart';
import 'package:redstar_module/presentation/ui/partner_detail/widgets/partner_offer_redeem_button.dart';
import 'package:redstar_module/presentation/ui/partner_detail/widgets/ticket_card_clipper.dart';

class PartnerOfferCard extends StatelessWidget {
  final PartnerOffer offer;
  final bool isRedeemed;

  const PartnerOfferCard({
    super.key,
    required this.offer,
    required this.isRedeemed,
  });

  @override
  Widget build(BuildContext context) {
    final bg = isRedeemed ? UIColor.lightGray : UIColor.bakcellRedTint;
    final padding = 12.r;
    final imageGap = 12.h;
    final bottomGap = 12.h;
    final borderRadius = 16.r;
    final notchRadius = 10.r;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final imageWidth = width - padding * 2;
        final imageHeight = imageWidth * 10 / 16;
        final notchY = padding + imageHeight + imageGap;

        return ClipPath(
          clipper: TicketCardClipper(
            borderRadius: borderRadius,
            notchRadius: notchRadius,
            notchY: notchY,
          ),
          child: Container(
            color: bg,
            padding: EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _OfferMedia(offer: offer, isRedeemed: isRedeemed),
                SizedBox(height: imageGap),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: notchRadius),
                  child: const DashedLine(),
                ),
                SizedBox(height: bottomGap),
                if (isRedeemed)
                  const PartnerOfferExpiredLabel()
                else
                  PartnerOfferRedeemButton(
                    offerId: offer.id,
                    isRedeemed: false,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _OfferMedia extends StatelessWidget {
  final PartnerOffer offer;
  final bool isRedeemed;

  const _OfferMedia({required this.offer, required this.isRedeemed});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: AspectRatio(
        aspectRatio: 16 / 10,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ColorFiltered(
              colorFilter: isRedeemed
                  ? const ColorFilter.matrix([
                      0.2126, 0.7152, 0.0722, 0, 0, //
                      0.2126, 0.7152, 0.0722, 0, 0, //
                      0.2126, 0.7152, 0.0722, 0, 0, //
                      0, 0, 0, 1, 0,
                    ])
                  : const ColorFilter.mode(
                      Colors.transparent,
                      BlendMode.multiply,
                    ),
              child: CachedNetworkImage(
                imageUrl: offer.imageUrl,
                fit: BoxFit.cover,
                placeholder: (_, __) =>
                    const ColoredBox(color: UIColor.lightGray),
                errorWidget: (_, __, ___) =>
                    const ColoredBox(color: UIColor.lightGray),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withValues(alpha: 0.45),
                    Colors.black.withValues(alpha: 0.05),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 12.h,
              right: 12.w,
              child: PartnerOfferPeriodBadge(period: offer.period),
            ),
            Positioned(
              left: 14.w,
              top: 14.h,
              right: 110.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Label(
                    text: offer.title,
                    size: 16.sp,
                    weight: FontWeight.w700,
                    color: UIColor.white,
                    maxLines: 3,
                  ),
                  10.verticalSpace,
                  PartnerOfferDiscountBadge(
                    label: offer.discountLabel,
                    isRedeemed: isRedeemed,
                  ),
                ],
              ),
            ),
            Positioned(
              left: 14.w,
              bottom: 12.h,
              child: Label(
                text: offer.brandLabel,
                size: 12.sp,
                weight: FontWeight.w500,
                color: UIColor.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
