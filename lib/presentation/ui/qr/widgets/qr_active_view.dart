import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/qr/widgets/qr_center_logo.dart';
import 'package:redstar_module/presentation/ui/qr/widgets/qr_code_text.dart';

class QrActiveView extends StatelessWidget {
  final String code;

  const QrActiveView({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    final qrUrl =
        'https://api.qrserver.com/v1/create-qr-code/?size=400x400&data=$code&format=png&qzone=1';
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.w),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: qrUrl,
                  fit: BoxFit.contain,
                  placeholder: (_, __) => const SizedBox.shrink(),
                  errorWidget: (_, __, ___) => const ColoredBox(
                    color: UIColor.lightGray,
                  ),
                ),
                const QrCenterLogo(),
              ],
            ),
          ),
        ),
        8.verticalSpace,
        QrCodeText(code: code),
        8.verticalSpace,
      ],
    );
  }
}
