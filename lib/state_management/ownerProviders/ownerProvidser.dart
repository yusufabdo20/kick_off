import 'package:flutter/material.dart';
import 'package:kick_off/services/network/owner_services/ownerServices.dart';

class OwnerProvider extends ChangeNotifier {
  int _numberOfRequests = 0;
  get numberOfRequests => _numberOfRequests;
  Future<void> getNumberOfRequests() async {
    _numberOfRequests = await GetOwnerNumbers().get_numberOfRequests();
    notifyListeners();
  }
  int _numberOfViews = 0;
  get numberOfViews => _numberOfViews;
  Future<void> getNumberOfViews() async {
    _numberOfRequests = await GetOwnerNumbers().get_numberOfViews();
    notifyListeners();
  }
  int _numberOfArea = 0;
  get numberOfArea => _numberOfArea;
  Future<void> getNumberOfArea() async {
    _numberOfArea = await GetOwnerNumbers().get_numberOfArea();
    notifyListeners();
  }
  int _numberOfClubs = 0;
  get numberOfClubs => _numberOfClubs;
  Future<void> getNumberOfClubs() async {
    _numberOfClubs = await GetOwnerNumbers().get_numberOfClubs();
    notifyListeners();
  }
  int _numberOfCalls = 0;
  get numberOfCalls => _numberOfCalls;
  Future<void> getNumberOfCalls() async {
    _numberOfCalls = await GetOwnerNumbers().get_numberOfCalls();
    notifyListeners();
  }
  // int _numberOfViews = 0;
  // get numberOfViews => _numberOfViews;
  // Future<void> getNumberOfViews() async {
  //   _numberOfRequests = await GetOwnerNumbers().get_numberOfViews();
  //   notifyListeners();
  // }
}
