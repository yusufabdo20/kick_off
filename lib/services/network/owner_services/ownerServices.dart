import '../../../components/constants.dart';
import '../../../models/UserModels/clubModel.dart';
import '../../api.dart';

class GetOwnerNumbers {
  Future<int> get_numberOfRequests() async {
    final url = '$baseUrl/admin/requests/count';

    Map<String, dynamic> data = await Api().get(
        apiUrl: url,
        token: 'Bearer 2|x7XFxAvsIm2gaq6U2twOQONBdglgyhbVci3a57fI');
    int numberOfRequests = 0;
    numberOfRequests = data['data'];
    print("numberOfRequests : $numberOfRequests");
    return numberOfRequests;
  }
  Future<int> get_numberOfViews() async {
    final url = '$baseUrl/admin/views/count';

    Map<String, dynamic> data = await Api().get(
        apiUrl: url,
        token: 'Bearer 2|x7XFxAvsIm2gaq6U2twOQONBdglgyhbVci3a57fI');
    int numberOfRequests = 0;
    numberOfRequests = data['data'];
    print("numberOfRequests : $numberOfRequests");
    return numberOfRequests;
  }
  Future<int> get_numberOfArea() async {
    final url = '$baseUrl/admin/area/count';

    Map<String, dynamic> data = await Api().get(
        apiUrl: url,
        token: 'Bearer 2|x7XFxAvsIm2gaq6U2twOQONBdglgyhbVci3a57fI');
    int numberOfRequests = 0;
    numberOfRequests = data['data'];
    print("numberOfRequests : $numberOfRequests");
    return numberOfRequests;
  }
  Future<int> get_numberOfClubs() async {
    final url = '$baseUrl/admin/clubs/count';

    Map<String, dynamic> data = await Api().get(
        apiUrl: url,
        token: 'Bearer 2|x7XFxAvsIm2gaq6U2twOQONBdglgyhbVci3a57fI');
    int numberOfRequests = 0;
    numberOfRequests = data['data'];
    print("numberOfRequests : $numberOfRequests");
    return numberOfRequests;
  }
  Future<int> get_numberOfCalls() async {
    final url = '$baseUrl/admin/calls/count';

    Map<String, dynamic> data = await Api().get(
        apiUrl: url,
        token: 'Bearer 2|x7XFxAvsIm2gaq6U2twOQONBdglgyhbVci3a57fI');
    int numberOfRequests = 0;
    numberOfRequests = data['data'];
    print("numberOfRequests : $numberOfRequests");
    return numberOfRequests;
  }
}
