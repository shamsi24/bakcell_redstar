import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

class HomeHeroTitle extends StatelessWidget {
  final double amount;

  const HomeHeroTitle({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    final amountText =
        amount % 1 == 0 ? amount.toStringAsFixed(0) : amount.toStringAsFixed(2);
    final parts = Lng.homeHeroTitleTemplate.split('{amount}');
    final prefix = parts.isNotEmpty ? parts.first : '';
    final suffix = parts.length > 1 ? parts.last : '';
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w700,
          color: UIColor.white,
          height: 1.25,
          letterSpacing: 0.2,
        ),
        children: [
          TextSpan(text: prefix),
          TextSpan(
            text: '$amountText ₼',
            style: const TextStyle(color: UIColor.bakcellRed),
          ),
          TextSpan(text: suffix),
        ],
      ),
    );
  }
}
