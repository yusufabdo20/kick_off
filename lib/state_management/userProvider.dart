import 'package:flutter/material.dart';

import '../models/personModel.dart';

class USerProvider extends ChangeNotifier {
  User? currentUser;

  void updateUser(User user) {
    currentUser = user;
    notifyListeners();
  }
}