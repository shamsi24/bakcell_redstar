import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/partner_detail/model/partner_summary.dart';
import 'package:redstar_module/presentation/ui/partner_detail/view/partner_detail_page.dart';
import 'package:redstar_module/presentation/ui/partners/model/partner_item.dart';
import 'package:redstar_module/presentation/ui/partners/provider/partners_provider.dart';
import 'package:redstar_module/presentation/ui/partners/widgets/partner_discount_badge.dart';

class PartnerListItem extends StatelessWidget {
  final PartnerItem partner;

  const PartnerListItem({super.key, required this.partner});

  @override
  Widget build(BuildContext context) {
    final categoryLabel =
        context.read<PartnersProvider>().categoryLabelOf(partner.categoryId);
    return Material(
      borderRadius: BorderRadius.circular(14.r),
      child: InkWell(
        borderRadius: BorderRadius.circular(14.r),
        onTap: () {
          HapticFeedback.lightImpact();
          _openDetail(context, categoryLabel);
        },
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CachedNetworkImage(
                  imageUrl: partner.logoUrl,
                  width: 56.r,
                  height: 56.r,
                  fit: BoxFit.cover,
                  placeholder: (_, __) => Container(
                    width: 56.r,
                    height: 56.r,
                    color: UIColor.white,
                  ),
                  errorWidget: (_, __, ___) => Container(
                    width: 56.r,
                    height: 56.r,
                    color: UIColor.white,
                  ),
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Label(
                      text: partner.name,
                      size: 15.sp,
                      weight: FontWeight.w700,
                      color: UIColor.black,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    4.verticalSpace,
                    Label(
                      text: categoryLabel,
                      size: 12.sp,
                      weight: FontWeight.w400,
                      color: UIColor.darkGrey,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              8.horizontalSpace,
              PartnerDiscountBadge(label: partner.discountLabel),
            ],
          ),
        ),
      ),
    );
  }

  void _openDetail(BuildContext context, String categoryLabel) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PartnerDetailPage(
          partner: PartnerSummary(
            id: partner.id,
            name: partner.name,
            logoUrl: partner.logoUrl,
            category: categoryLabel,
            discountLabel: partner.discountLabel,
          ),
        ),
      ),
    );
  }
}
