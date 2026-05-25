import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/qr/model/qr_partner_info.dart';
import 'package:redstar_module/presentation/ui/qr/provider/qr_provider.dart';
import 'package:redstar_module/presentation/ui/qr/view/qr_body.dart';

class QrPage extends StatelessWidget {
  final QrPartnerInfo? partner;

  const QrPage({super.key, this.partner});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QrProvider>(
      create: (_) => QrProvider(partner: partner),
      child: const Scaffold(
        backgroundColor: UIColor.white,
        body: QrBody(),
      ),
    );
  }
}
