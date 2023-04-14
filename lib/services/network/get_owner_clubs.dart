import 'package:kick_off/models/clubModel.dart';

import '../../components/constants.dart';
import '../api.dart';

class GetOwnerClubs {
  Future<List<ClubModel>> getOwnerClubs() async {
    final url = '$baseUrl/clubs/admin';

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
