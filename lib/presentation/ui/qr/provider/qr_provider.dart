import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:redstar_module/presentation/ui/qr/model/qr_partner_info.dart';

class QrProvider extends ChangeNotifier {
  QrProvider({this.partner});

  static const int _codeLifetimeSeconds = 300;

  final QrPartnerInfo? partner;

  String? _generatedCode;
  int _remainingSeconds = _codeLifetimeSeconds;
  Timer? _timer;

  String? get generatedCode => _generatedCode;
  int get remainingSeconds => _remainingSeconds;
  bool get isLocked => _generatedCode == null;

  void generateCode() {
    _generatedCode = _randomCode();
    _remainingSeconds = _codeLifetimeSeconds;
    _startTimer();
    notifyListeners();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remainingSeconds <= 1) {
        _expireCode();
      } else {
        _remainingSeconds--;
        notifyListeners();
      }
    });
  }

  void _expireCode() {
    _timer?.cancel();
    _timer = null;
    _generatedCode = null;
    _remainingSeconds = _codeLifetimeSeconds;
    notifyListeners();
  }

  String _randomCode() {
    final random = Random();
    final first = 1000 + random.nextInt(9000);
    final second = 1000 + random.nextInt(9000);
    return '$first-$second';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
