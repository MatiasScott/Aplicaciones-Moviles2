import 'package:flutter/material.dart';

class DatosProvider extends ChangeNotifier {
  bool _isregister = false;
  bool get isregister => _isregister;
  set isregister(bool isregister) {
    _isregister = isregister;
    notifyListeners();
  }
}
