import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/main/provider/main_provider.dart';
import 'package:redstar_module/presentation/ui/main/view/main_body.dart';
import 'package:redstar_module/presentation/ui/main/widgets/main_bottom_nav.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainProvider>(
      create: (_) => MainProvider(),
      child: const Scaffold(
        backgroundColor: UIColor.white,
        body: MainBody(),
        bottomNavigationBar: MainBottomNav(),
      ),
    );
  }
}
