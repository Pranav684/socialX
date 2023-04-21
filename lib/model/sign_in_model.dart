import 'package:flutter/material.dart';

class SignInProvider with ChangeNotifier {
  bool _islogin = false;
  bool _accept = false;
  bool get islogin {
    return _islogin;
  }

  bool get accept {
    return _accept;
  }

  void setAcceptance(value) {
    _accept = value;
    notifyListeners();
  }

  void setLoginValue(value) {
    _islogin = value;
    notifyListeners();
  }
}
