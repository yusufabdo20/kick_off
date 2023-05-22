import 'dart:convert';

import '../../../components/constants.dart';
import '../../../models/UserModels/ownerClubsModel.dart';
import '../../api.dart';
import '../../local/cash.dart';

class GetOwnerClubsService {
  Future<List<OwnerClubsModel>> getOwnerClubs(int adminId) async {
    final url = '$baseUrl/clubs/admin';
    Map<String, dynamic> data = await Api().post(
      body: {
        'admin_id': adminId.toString(),
      },
      apiUrl: url,
      // token: "Bearer $userToken",
      token: 'Bearer $userToken'
    ); // NOTE :: in UI will use FutureBuilder
    List<OwnerClubsModel> clubsList = [];
    for (int i = 0; i < data['data'].length; i++) {
      clubsList.add(OwnerClubsModel.fromJson(data['data'][i]));
      print('----------------------------------------------');
      print(data['data'][i]);
    }
    print('object') ;
    print(userToken) ;

    return clubsList;
  }
}
