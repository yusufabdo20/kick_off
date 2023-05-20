import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../components/constants.dart';
import '../models/UserModels/areaModel.dart';

class AreaProvider extends ChangeNotifier {
  List<AreaModel> _cities = [];

  List<AreaModel> get cities => _cities;

  Future<void> fetchCities() async {
    try {
      final response = await Dio().get('$baseUrl/area');
      if (response.statusCode == 200) {
        final data = response.data['data'] as List<dynamic>;
        _cities = data.map((city) => AreaModel.fromJson(city)).toList();
        notifyListeners();
      }
    } catch (error) {
      print(error);
    }
  }
}