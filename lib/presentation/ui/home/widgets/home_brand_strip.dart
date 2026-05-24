import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/ui/home/model/home_brand.dart';
import 'package:redstar_module/presentation/ui/home/widgets/home_brand_logo.dart';

class HomeBrandStrip extends StatelessWidget {
  final List<HomeBrand> brands;

  const HomeBrandStrip({super.key, required this.brands});

  @override
  Widget build(BuildContext context) {
    final logoSize = 44.r;
    final arcDepth = 20.h;
    return SizedBox(
      height: logoSize + arcDepth,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final count = brands.length;
          if (count == 0) return const SizedBox.shrink();

          final spread = width * 1.1;
          final startX = (width - spread) / 2;
          final stepX = count > 1 ? spread / (count - 1) : 0.0;

          return Stack(
            clipBehavior: Clip.none,
            children: List.generate(count, (i) {
              final t = count > 1 ? i / (count - 1) : 0.5;
              final edgeWeight = 4 * (t - 0.5) * (t - 0.5);
              final yOffset = arcDepth * (1 - edgeWeight);
              final x = startX + i * stepX - logoSize / 2;
              return Positioned(
                left: x,
                top: yOffset,
                child: HomeBrandLogo(brand: brands[i]),
              );
            }),
          );
        },
      ),
    );
  }
}
