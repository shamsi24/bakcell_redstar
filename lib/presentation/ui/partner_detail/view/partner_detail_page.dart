import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/partner_detail/model/partner_summary.dart';
import 'package:redstar_module/presentation/ui/partner_detail/provider/partner_detail_provider.dart';
import 'package:redstar_module/presentation/ui/partner_detail/view/partner_detail_body.dart';

class PartnerDetailPage extends StatelessWidget {
  final PartnerSummary partner;

  const PartnerDetailPage({super.key, required this.partner});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PartnerDetailProvider>(
      create: (_) => PartnerDetailProvider(partner: partner),
      child: const Scaffold(
        backgroundColor: UIColor.white,
        body: PartnerDetailBody(),
      ),
    );
  }
}
