import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redstar_module/app/cubit/app_cubit.dart';
import 'package:redstar_module/app/view/app.dart';

class AppRunner extends StatelessWidget {
  const AppRunner({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      saveLocale: true,
      startLocale: const Locale('az'),
      path: "assets/translations",
      supportedLocales: const [Locale("az")],
      fallbackLocale: const Locale("az"),
      child: BlocProvider(
        create: (_) => AppCubit(),
        child: const App(),
      ),
    );
  }
}
