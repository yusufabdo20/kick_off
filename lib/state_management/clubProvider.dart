import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kick_off/components/constants.dart';
import 'package:kick_off/services/network/user_services/get_all_clubs_for_home_sevice.dart';
import 'package:kick_off/services/network/user_services/get_owner_clubs.dart';
import 'package:kick_off/services/network/user_services/git_specific_club_services.dart';
import 'package:provider/provider.dart';

import '../models/UserModels/areaModel.dart';
import '../models/UserModels/clubModel.dart';
import '../models/UserModels/ownerClubsModel.dart';
import '../services/api.dart';
import 'package:http/http.dart' as http;

class ClubProvider extends ChangeNotifier {
  List<ClubModel> _allClubs = [];
  List<ClubModel> _allClubsB = [];
  List<ClubModel> get allClubs => [..._allClubs];
  List<ClubModel> get allClubsB => [..._allClubsB];
  List<ClubModel> _specificClub = [];
  List<ClubModel> get specificClub => _specificClub;
  List<OwnerClubsModel> _ownerClubs = [];
  List<OwnerClubsModel> get ownerClubs => _ownerClubs;
  Future<void> getAllClubsForHome() async {
    final service = GetAllClubsForHome();
    final response = await service.getAllClubsForHome();
    _allClubs = response;
    _allClubsB = response;
    notifyListeners();
  }

  Future<void> getSpecificClub(int clubID) async {
    _specificClub = await GetSpecificClubService().getSpecificClub(clubID);
    notifyListeners();
  }

  Future<void> getOwnerClubs(String adminID) async {
    _ownerClubs = await GetOwnerClubsService().getOwnerClubs(adminID);
    // changeSelectedAdminId(adminID);
    notifyListeners();
  }

  void setClubs(List<ClubModel> clubs) {
    _allClubs = clubs;
    notifyListeners();
  }

  // var adminId = 0;

  // changeSelectedAdminId(id) {
  //   adminId = id;
  //   notifyListeners();
  // }

  // getSelectedAdminId() {
  //   return adminId;
  // }
}
