import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool? isObsecures = true;
  changeObsecure() {
    isObsecures = !(isObsecures ?? false);
    notifyListeners();
  }
}
