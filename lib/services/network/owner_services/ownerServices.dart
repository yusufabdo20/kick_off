import 'package:http/http.dart';
import 'package:kick_off/models/OwnerModels/requestReportModel.dart';

import '../../../components/constants.dart';
import '../../../models/UserModels/clubModel.dart';
import '../../api.dart';

class GetOwnerData {
  Future<int> get_numberOfRequests() async {
    final url = '$baseUrl/admin/requests/count';

    Map<String, dynamic> data =
        await Api().get(apiUrl: url, token: 'Bearer $userToken');
    int numberOfRequests;
    numberOfRequests = data['data'];
    print("numberOfRequests : $numberOfRequests");
    return numberOfRequests;
  }

  Future<int> get_numberOfViews() async {
    final url = '$baseUrl/admin/views/count';

    Map<String, dynamic> data =
        await Api().get(apiUrl: url, token: 'Bearer $userToken');
    int numberOfViews;
    numberOfViews = data['data'];
    print("numberOfViews : $numberOfViews");
    return numberOfViews;
  }

  Future<int> get_numberOfArea() async {
    final url = '$baseUrl/admin/area/count';

    Map<String, dynamic> data =
        await Api().get(apiUrl: url, token: 'Bearer $userToken');
    int numberOfArea = 0;
    numberOfArea = data['data'];
    print("numberOfRequests : $numberOfArea");
    return numberOfArea;
  }

  Future<int> get_numberOfClubs() async {
    final url = '$baseUrl/admin/clubs/count';

    Map<String, dynamic> data =
        await Api().get(apiUrl: url, token: 'Bearer $userToken');
    int numberOfClubs = 0;
    numberOfClubs = data['data'];
    print("numberOfClubs : $numberOfClubs");
    return numberOfClubs;
  }

  Future<int> get_numberOfCalls() async {
    final url = '$baseUrl/admin/calls/count';

    Map<String, dynamic> data =
        await Api().get(apiUrl: url, token: 'Bearer $userToken');
    int numberOfCalls = 0;
    numberOfCalls = data['data'];
    print("numberOfCalls : $numberOfCalls");
    return numberOfCalls;
  }

  Future<int> get_adminName() async {
    final url = '$baseUrl/admin/calls/count';

    Map<String, dynamic> data =
        await Api().get(apiUrl: url, token: 'Bearer $userToken');
    int numberOfCalls = 0;
    numberOfCalls = data['data'];
    print("numberOfCalls : $numberOfCalls");
    return numberOfCalls;
  }

  Future<List<RequestReportModel>> get_requests_report() async {
    final url = '$baseUrl/admin/book/report';
    Map<String, dynamic> data =
        await Api().get(apiUrl: url, token: 'Bearer $userToken');
    List<RequestReportModel> requests_report = [];
    for (int i = 0; i < data['data'].length; i++) {
      requests_report.add(
        RequestReportModel.fromJson(data['data'][i]),
      );
    }
    return requests_report;
  }

  Future<List<ViewsReportModel>> get_views_report() async {
    final url = '$baseUrl/admin/views/report';
    Map<String, dynamic> data =
        await Api().get(apiUrl: url, token: 'Bearer $userToken');
    List<ViewsReportModel> views_report = [];
    for (int i = 0; i < data['data'].length; i++) {
      views_report.add(
        ViewsReportModel.fromJson(data['data'][i]),
      );
    }
    return views_report;
  }
  Future<List<CallsReportModel>> get_calls_report() async {
    final url = '$baseUrl/admin/calls/report';
    Map<String, dynamic> data =
        await Api().get(apiUrl: url, token: 'Bearer $userToken');
    List<CallsReportModel> calls_report = [];
    for (int i = 0; i < data['data'].length; i++) {
      calls_report.add(
        CallsReportModel.fromJson(data['data'][i]),
      );
    }
    return calls_report;
  }
}
