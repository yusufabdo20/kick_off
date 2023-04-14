import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/areaModel.dart';
import '../models/clubModel.dart';
import '../services/api.dart';

class ClubProvider extends ChangeNotifier {
  List<ClubModel> _clubs = [];
  List<ClubModel> get clubsList => [..._clubs];

  Future<void> getAllClubsForHome() async {
    final url = 'http://127.0.0.1:8000/api/clubs';

    Map<String, dynamic> data = await Api().get(
      apiUrl: url,
    ); // NOTE :: in UI will use FutureBuilder
    List<ClubModel> _clubsList = [];
    for (int i = 0; i < data['data'].length; i++) {
      _clubsList.add(ClubModel.fromJson(data['data'][i]));
    }
    _clubs = clubsList;
    notifyListeners();
    // return _clubs;
  }

  List<ClubModel> _specificClubs = [];

  List<ClubModel> get specificClubsList => [..._clubs];

  Future<void> getSpecificClub(int clubID) async {
    final url = 'http://127.0.0.1:8000/api/clubs/$clubID';

    Map<String, dynamic> data = await Api().get(
      apiUrl: url,
    ); // NOTE :: in UI will use FutureBuilder
    List<ClubModel> _clubsList = [];
    for (int i = 0; i < data['data'].length; i++) {
      _clubsList.add(ClubModel.fromJson(data['data'][i]));
    }
    _specificClubs = _clubsList;
    notifyListeners();
  }
}
