import 'package:flutter/material.dart';
import 'package:kick_off/services/network/owner_services/ownerServices.dart';

import '../../models/OwnerModels/requestReportModel.dart';

class OwnerProvider extends ChangeNotifier {
  int _numberOfRequests = 0;
  get numberOfRequests => _numberOfRequests;
  Future<void> getNumberOfRequests() async {
    _numberOfRequests = await GetOwnerData().get_numberOfRequests();
    notifyListeners();
  }

  int _numberOfViews = 0;
  get numberOfViews => _numberOfViews;
  Future<void> getNumberOfViews() async {
    _numberOfViews = await GetOwnerData().get_numberOfViews();
    notifyListeners();
  }

  int _numberOfArea = 0;
  get numberOfArea => _numberOfArea;
  Future<void> getNumberOfArea() async {
    _numberOfArea = await GetOwnerData().get_numberOfArea();
    notifyListeners();
  }

  int _numberOfClubs = 0;
  get numberOfClubs => _numberOfClubs;
  Future<void> getNumberOfClubs() async {
    _numberOfClubs = await GetOwnerData().get_numberOfClubs();
    notifyListeners();
  }

  int _numberOfCalls = 0;
  get numberOfCalls => _numberOfCalls;
  Future<void> getNumberOfCalls() async {
    _numberOfCalls = await GetOwnerData().get_numberOfCalls();
    notifyListeners();
  }

  String _adminName = '';
  get adminName => _adminName;
  Future<void> getAdminName(String adminNamee) async {
    _adminName = adminNamee;
    notifyListeners();
  }

  List<RequestReportModel> _requestsReport = [];
  get requestsReport => [..._requestsReport];
  Future<void> get_requestReport() async {
    _requestsReport = await GetOwnerData().get_requests_report();
    notifyListeners();
  }

  List<ViewsReportModel> _viewsReport = [];
  get viewsReport => [..._viewsReport];
  Future<void> get_viewsReport() async {
    _viewsReport = await GetOwnerData().get_views_report();
    notifyListeners();
  }

  List<CallsReportModel> _callsReport = [];
  get callsReport => [..._callsReport];
  Future<void> get_callsReport() async {
    _callsReport = await GetOwnerData().get_calls_report();
    notifyListeners();
  }
}
