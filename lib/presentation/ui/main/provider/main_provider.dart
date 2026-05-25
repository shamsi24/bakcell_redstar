import 'package:flutter/material.dart';
import 'package:redstar_module/presentation/shared/shared.dart';

enum MainTab {
  home(icon: Img.home, filledIcon: Img.homeFilled),
  qr(icon: Img.scan, filledIcon: Img.scan),
  partners(icon: Img.exhibition, filledIcon: Img.exhibition);

  final String icon;

  final String filledIcon;

  const MainTab({required this.icon, required this.filledIcon});

  String get label {
    switch (this) {
      case MainTab.home:
        return Lng.mainTabMain;
      case MainTab.qr:
        return Lng.mainTabGetQr;
      case MainTab.partners:
        return Lng.mainTabPartners;
    }
  }
}

class MainProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  List<MainTab> get tabs => MainTab.values;

  void change(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    notifyListeners();
  }
}
