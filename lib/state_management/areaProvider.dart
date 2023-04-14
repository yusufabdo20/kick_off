import 'package:flutter/material.dart';
import 'package:kick_off/services/network/areaService.dart';

import '../models/areaModel.dart';

class AreaProvider with ChangeNotifier {
  List<Area> areas = [];

  List<Area> get locations => areas;
  getAreas() async {
    areas = await GetAreaService().getAllArea();
    notifyListeners();
  }
  // Future<void> fetchLocations() async {
  //   final url = Uri.parse('https://your-api-url.com/locations');
  //   try {
  //     final response = await http.get(url);
  //     final extractedData = json.decode(response.body)['data'] as List<dynamic>;
  //     final List<Location> loadedLocations = [];
  //     extractedData.forEach((locationData) {
  //       loadedLocations.add(Location.fromJson(locationData));
  //     });
  //     _locations = loadedLocations;
  //     notifyListeners();
  //   } catch (error) {
  //     throw (error);
  //   }
  // }
}
