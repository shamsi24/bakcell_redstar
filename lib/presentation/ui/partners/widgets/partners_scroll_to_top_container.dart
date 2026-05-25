import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/ui/partners/provider/partners_provider.dart';
import 'package:redstar_module/presentation/ui/partners/widgets/partners_scroll_to_top_button.dart';

class PartnersScrollToTopContainer extends StatelessWidget {
  const PartnersScrollToTopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final show =
        context.select<PartnersProvider, bool>((p) => p.showScrollToTop);
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: ScaleTransition(scale: animation, child: child),
      ),
      child: show
          ? PartnersScrollToTopButton(
              key: const ValueKey('show'),
              onPressed: () =>
                  context.read<PartnersProvider>().scrollToTop(),
            )
          : const SizedBox.shrink(key: ValueKey('hide')),
    );
  }
}
