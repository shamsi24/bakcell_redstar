import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/partner_detail/provider/partner_detail_provider.dart';
import 'package:redstar_module/presentation/ui/qr/model/qr_partner_info.dart';
import 'package:redstar_module/presentation/ui/qr/view/qr_page.dart';

class PartnerOfferRedeemButton extends StatelessWidget {
  final String offerId;
  final bool isRedeemed;

  const PartnerOfferRedeemButton({
    super.key,
    required this.offerId,
    required this.isRedeemed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44.h,
      child: ElevatedButton(
        onPressed: isRedeemed ? null : () => _onTap(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: UIColor.bakcellRed,
          disabledBackgroundColor: UIColor.clear,
          foregroundColor: UIColor.white,
          disabledForegroundColor: UIColor.darkGrey,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        child: Label(
          text: isRedeemed ? Lng.partnerRedeemed : Lng.partnerRedeem,
          size: 14.sp,
          weight: FontWeight.w700,
          color: isRedeemed ? UIColor.darkGrey : UIColor.white,
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    HapticFeedback.mediumImpact();
    final provider = context.read<PartnerDetailProvider>();
    final partner = provider.partner;
    final offer = provider.offers.firstWhere((o) => o.id == offerId);
    provider.redeemOffer(offerId);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => QrPage(
          partner: QrPartnerInfo(
            id: partner.id,
            name: partner.name,
            discountPercent: _parseDiscountPercent(offer.discountLabel),
            remainingLimits: 5,
          ),
        ),
      ),
    );
  }

  int _parseDiscountPercent(String label) {
    final match = RegExp(r'(\d+)').firstMatch(label);
    if (match == null) return 0;
    return int.parse(match.group(1)!);
  }
}
