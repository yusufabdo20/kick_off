import 'dart:convert';

import '../../../components/constants.dart';
import '../../../models/UserModels/ownerClubsModel.dart';
import '../../api.dart';
import '../../local/cash.dart';

class BookingClubService {
  Future<void> bookClub(
      int club_id, String date, String start_time, String end_time) async {
    final url = '$baseUrl/book';
    Map<String, dynamic> data = await Api().post(
      body: {
        'club_id': club_id.toString(),
        'date': date,
        'start_time': start_time,
        'end_time': end_time,
      },
      apiUrl: url,
      token: "Bearer $userToken",
    );
    print('--------------------------------------------------------------');
    print(data);
  }
}
