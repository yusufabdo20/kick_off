import 'package:flutter/material.dart';

import '../models/userModel.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  void setUser(Map<String, dynamic> json) {
    _user = UserModel.fromJson(json);
    notifyListeners();
  }
}
