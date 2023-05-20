import 'dart:convert';


import '../../../components/constants.dart';
import '../../../models/UserModels/ownerClubsModel.dart';
import '../../api.dart';
import '../../local/cash.dart';

class BookingClubService {
  Future<void> bookClub(int club_id) async {
    final url = '$baseUrl/book';
    Map<String, dynamic> data = await Api().post(
      body: {
        'club_id': club_id.toString(),
      },
      apiUrl: url,
      token: "Bearer $userToken",
    ); // NOTE :: in UI will use FutureBuilder
    List<OwnerClubsModel> clubsList = [];
    for (int i = 0; i < data['data'].length; i++) {
      clubsList.add(OwnerClubsModel.fromJson(data['data'][i]));
    }
  }
}
