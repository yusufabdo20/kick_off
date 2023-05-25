import '../../../components/constants.dart';
import '../../../models/UserModels/clubModel.dart';
import '../../api.dart';

class GetOwnerNumbers {
  Future<int> get_numberOfRequests() async {
    final url = '$baseUrl/admin/requests/count';

    Map<String, dynamic> data = await Api().get(
        apiUrl: url,
        token: 'Bearer $userToken');
    int numberOfRequests;
    numberOfRequests = data['data'];
    print("numberOfRequests : $numberOfRequests");
    return numberOfRequests;
  }
  Future<int> get_numberOfViews() async {
    final url = '$baseUrl/admin/views/count';

    Map<String, dynamic> data = await Api().get(
        apiUrl: url,
        token: 'Bearer $userToken');
    int numberOfViews;
    numberOfViews = data['data'];
    print("numberOfViews : $numberOfViews");
    return numberOfViews;
  }
  Future<int> get_numberOfArea() async {
    final url = '$baseUrl/admin/area/count';

    Map<String, dynamic> data = await Api().get(
        apiUrl: url,
        token: 'Bearer $userToken');
    int numberOfArea = 0;
    numberOfArea = data['data'];
    print("numberOfRequests : $numberOfArea");
    return numberOfArea;
  }
  Future<int> get_numberOfClubs() async {
    final url = '$baseUrl/admin/clubs/count';

    Map<String, dynamic> data = await Api().get(
        apiUrl: url,
        token: 'Bearer $userToken');
    int numberOfClubs = 0;
    numberOfClubs = data['data'];
    print("numberOfClubs : $numberOfClubs");
    return numberOfClubs;
  }
  Future<int> get_numberOfCalls() async {
    final url = '$baseUrl/admin/calls/count';

    Map<String, dynamic> data = await Api().get(
        apiUrl: url,
        token: 'Bearer $userToken');
    int numberOfCalls = 0;
    numberOfCalls = data['data'];
    print("numberOfCalls : $numberOfCalls");
    return numberOfCalls;
  }
}
