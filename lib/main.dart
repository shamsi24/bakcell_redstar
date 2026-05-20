import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redstar_module/app/view/app_runner.dart';
import 'package:redstar_module/app/view/delegate.dart';
import 'package:redstar_module/app/view/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.register();
  await ScreenUtil.ensureScreenSize();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Bloc.observer = SimpleBlocObserver();

  runApp(const AppRunner());
}
