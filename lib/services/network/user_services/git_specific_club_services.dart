import '../../../components/constants.dart';
import '../../../models/UserModels/clubModel.dart';
import '../../api.dart';

class GetSpecificClubService {
  Future<List<ClubModel>> getSpecificClub(int clubId) async {
    final url = '$baseUrl/clubs/$clubId';

    Map<String, dynamic> data = await Api().get(
      apiUrl: url,
    ); // NOTE :: in UI will use FutureBuilder
    var json = data['data'];
    print(data);
    List<ClubModel> club = [];
    for (int i = 0; i < json.length; i++) {
      club.add(
        ClubModel.fromJson(data["data"][i]),
      );
    }

    return club;
  }
}
