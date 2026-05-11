import 'package:flutter/material.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_map_button.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_search_field.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: HomeSearchField()),
        8.horizontal,
        const HomeMapButton(),
      ],
    );
  }
}
