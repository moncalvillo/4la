import 'package:flutter/material.dart';

class SessionProvider with ChangeNotifier {
  String? _nickname;

  String? get nickname => _nickname;

  bool get isNamed => _nickname != null && _nickname!.isNotEmpty;

  void setNickname(String nickname) {
    _nickname = nickname;
    notifyListeners();
  }
}
