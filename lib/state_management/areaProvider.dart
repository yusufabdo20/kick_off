import 'package:flutter/material.dart';
import 'package:kick_off/services/network/user_services/areaService.dart';

import '../models/areaModel.dart';

class AreaProvider with ChangeNotifier {
  List<Area> areas = [];

  List<Area> get locations => [...areas];
  getAreas() async {
    areas = await GetAreaService().getAllArea();
    notifyListeners();
  }
}
