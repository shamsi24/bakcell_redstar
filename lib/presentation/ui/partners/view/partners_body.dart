import 'package:flutter/material.dart';
import 'package:redstar_module/presentation/ui/partners/widgets/partners_scroll_view.dart';

class PartnersBody extends StatelessWidget {
  const PartnersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      bottom: false,
      child: PartnersScrollView(),
    );
  }
}
