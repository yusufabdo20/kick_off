
import '../../../components/constants.dart';
import '../../../models/UserModels/clubModel.dart';
import '../../api.dart';

class GetAllClubsForHome {
  Future<List<ClubModel>> getAllClubsForHome() async {
    final url = '$baseUrl/clubs';

    Map<String, dynamic> data = await Api().get(
      apiUrl: url,
    ); 
    List<ClubModel> clubsList =[];
    for (int i = 0; i < data['data'].length; i++) {
      print('getAllClubsForHome in FOR LOOP ' ) ;
      clubsList.add(ClubModel.fromJson(data['data'][i]));
    }
    return clubsList;
  }
}
