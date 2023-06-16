import '../../../components/constants.dart';
import '../../api.dart';

class CallingClubService {
  Future<void> callingClub(int club_id, int admin_id) async {
    final url = '$baseUrl/call';
    Map<String, dynamic> data = await Api().post(
      body: {
        'admin_id': club_id.toString(),
        'club_id': admin_id.toString(),
      },
      apiUrl: url,
      token: "Bearer $userToken",
    );
    print('--------------------------------------------------------------');
    print(data);
  }
}
