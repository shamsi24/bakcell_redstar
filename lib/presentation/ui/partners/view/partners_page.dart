import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/partners/provider/partners_provider.dart';
import 'package:redstar_module/presentation/ui/partners/view/partners_body.dart';
import 'package:redstar_module/presentation/ui/partners/widgets/partners_scroll_to_top_container.dart';

class PartnersPage extends StatelessWidget {
  const PartnersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PartnersProvider>(
      create: (_) => PartnersProvider(),
      child: const Scaffold(
        backgroundColor: UIColor.white,
        body: PartnersBody(),
        floatingActionButton: PartnersScrollToTopContainer(),
      ),
    );
  }
}
