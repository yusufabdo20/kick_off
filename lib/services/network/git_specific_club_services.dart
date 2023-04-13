
import 'package:kick_off/models/clubModel.dart';

import '../api.dart';

class GetSpecificClubService {
  Future<List<ClubModel>> getAllArea(int clubID) async {
    final url = 'http://127.0.0.1:8000/api/clubs/$clubID';

    Map<String, dynamic> data = await Api().get(
      apiUrl: url,
    ); // NOTE :: in UI will use FutureBuilder 
    List<ClubModel> clubsList = [];
    for (int i = 0; i < data['data'].length; i++) {
      clubsList.add(ClubModel.fromJson(data['data'][i]));
    }
    return clubsList;
  }
}