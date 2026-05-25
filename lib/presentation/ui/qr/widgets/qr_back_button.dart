import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:redstar_module/presentation/shared/shared.dart';
import 'package:redstar_module/presentation/ui/main/provider/main_provider.dart';

class QrBackButton extends StatelessWidget {
  const QrBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        HapticFeedback.lightImpact();
        final navigator = Navigator.of(context);
        if (navigator.canPop()) {
          navigator.pop();
        } else {
          context.read<MainProvider>().change(0);
        }
      },
      icon: Icon(
        CupertinoIcons.back,
        color: UIColor.black,
        size: 26.sp,
      ),
    );
  }
}
