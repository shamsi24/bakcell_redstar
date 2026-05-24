import 'package:flutter/material.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/ui/home/view/home_page.dart';
import 'package:redstar_module/presentation/ui/main/provider/main_provider.dart';
import 'package:redstar_module/presentation/ui/partners/view/partners_page.dart';
import 'package:redstar_module/presentation/ui/qr/view/qr_page.dart';

class MainPageSwitcher extends StatelessWidget {
  const MainPageSwitcher({super.key});

  static const List<Widget> _pages = [
    HomePage(),
    QrPage(),
    PartnersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final index = context.select<MainProvider, int>((p) => p.currentIndex);
    return LazyLoadIndexedStack(
      index: index,
      children: _pages,
    );
  }
}
