import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kick_off/services/network/user_services/get_all_clubs_for_home_sevice.dart';
import 'package:kick_off/services/network/user_services/get_owner_clubs.dart';
import 'package:kick_off/services/network/user_services/git_specific_club_services.dart';

import '../models/areaModel.dart';
import '../models/clubModel.dart';
import '../services/api.dart';

class ClubProvider extends ChangeNotifier {
  List<ClubModel> allClubs = [];
  List<ClubModel> get clubsList => [...allClubs];
  List<ClubModel> specificClubs = [];
  List<ClubModel> get specificClubsList => [...specificClubs];

  List<ClubModel> ownerClubs = [];

  List<ClubModel> get ownerClubsList => [...ownerClubs];

  getAllClubsForHome() async {
    allClubs = await GetAllClubsForHome().getAllClubsForHome();
    notifyListeners();
  }

  getSpecificClub(int clubID) async {
    specificClubs = await GetSpecificClubService().getSpecificClub(clubID);
    notifyListeners();
  }

  getOwnerClubs() async {
    specificClubs = await GetOwnerClubsService().getOwnerClubs();
    notifyListeners();
  }
}
